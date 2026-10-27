import 'dart:convert';

/// What the person reports.
enum ProblemKind { bug, idea }

/// A report sent to the server (OpenSubsonic extension "octoReportProblem").
class ProblemReport {
  const ProblemReport({
    required this.kind,
    required this.message,
    required this.appVersion,
    required this.platform,
    required this.osVersion,
    this.songId,
    this.log,
  });

  static const maxMessageLength = 4000;
  static const maxLogBytes = 100 * 1024;

  final ProblemKind kind;
  final String message;
  final String appVersion;
  final String platform;
  final String osVersion;

  /// Only with the technical details the person chose to include.
  final String? songId;
  final String? log;

  /// The fields of the request body.
  Map<String, String> toFields() => {
        'kind': kind.name,
        'message': message,
        'appVersion': appVersion,
        'platform': platform,
        'osVersion':
            osVersion.length > 200 ? osVersion.substring(0, 200) : osVersion,
        if (songId != null) 'songId': songId!,
        if (log != null && log!.isNotEmpty) 'log': log!,
      };

  /// A GitHub issue page filled with the message, for a server that does
  /// not take reports. The log stays out: GitHub issues are public.
  Uri gitHubIssueUrl() {
    final firstLine = message.trim().split('\n').first;
    final title =
        firstLine.length > 80 ? '${firstLine.substring(0, 80)}…' : firstLine;
    return Uri.https('github.com', '/CharlesDuchaussoy/Octave/issues/new', {
      'title': title,
      'body': '${message.trim()}\n\n---\nOctave $appVersion · $platform',
      'labels': kind == ProblemKind.bug ? 'bug' : 'enhancement',
    });
  }
}

/// [lines] of the app log, cleaned for a report: the server address
/// becomes `<serveur>`, account names and secrets in addresses are masked,
/// and only the most recent lines that fit in [maxBytes] are kept.
String cleanLog(
  List<String> lines, {
  String? serverUrl,
  int maxBytes = ProblemReport.maxLogBytes,
}) {
  final base = serverUrl?.trim().replaceAll(RegExp(r'/+$'), '') ?? '';
  final host = base.isEmpty ? '' : (Uri.tryParse(base)?.host ?? '');
  final secrets = RegExp(r'([?&](?:u|t|s|p|token|apiKey)=)[^&\s]+');
  // A long hexadecimal folder right after the server, like a secret prefix.
  final prefix = RegExp(r'<serveur>/[0-9a-fA-F]{16,}');

  String clean(String line) {
    var out = line;
    if (base.isNotEmpty) out = out.replaceAll(base, '<serveur>');
    if (host.isNotEmpty) {
      out = out.replaceAll(RegExp('https?://${RegExp.escape(host)}'), '<serveur>');
      out = out.replaceAll(host, '<serveur>');
    }
    out = out.replaceAllMapped(secrets, (m) => '${m[1]}***');
    return out.replaceAll(prefix, '<serveur>');
  }

  final kept = <String>[];
  var size = 0;
  for (final line in lines.reversed) {
    final cleaned = clean(line);
    final bytes = utf8.encode(cleaned).length + 1;
    if (size + bytes > maxBytes) break;
    kept.add(cleaned);
    size += bytes;
  }
  return kept.reversed.join('\n');
}
