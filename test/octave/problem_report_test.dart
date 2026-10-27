import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:musly/octave/report/problem_report.dart';
import 'package:musly/octave/report/report_problem_screen.dart';

import '../test_helpers.dart';

void main() {
  const server = 'https://music.example.org/0123456789abcdef0123456789abcdef';

  group('cleanLog', () {
    test('hides the server address, its prefix and the account', () {
      final log = cleanLog([
        '[Musly] → GET $server/rest/ping?u=lea&t=abc&s=def&f=json',
        'Cover https://music.example.org/0123456789abcdef0123456789abcdef/'
            'rest/getCoverArt?id=1',
        'Radio https://music.example.org/radio/stream/xyz',
      ], serverUrl: '$server/');

      expect(log, isNot(contains('music.example.org')));
      expect(log, isNot(contains('0123456789abcdef')));
      expect(log, isNot(contains('u=lea')));
      expect(log, contains('<serveur>/rest/ping?u=***&t=***&s=***&f=json'));
      expect(log, contains('<serveur>/radio/stream/xyz'));
    });

    test('keeps the most recent lines that fit', () {
      final lines = [for (var i = 0; i < 100; i++) 'line $i'];
      final log = cleanLog(lines, maxBytes: 40);

      expect(log.split('\n').last, 'line 99');
      expect(log, isNot(contains('line 0\n')));
      expect(log.length, lessThanOrEqualTo(40));
    });
  });

  group('ProblemReport', () {
    const report = ProblemReport(
      kind: ProblemKind.bug,
      message: 'Le son coupe\nau milieu des titres',
      appVersion: '1.0.0',
      platform: 'android',
      osVersion: 'Android 16',
      songId: 's1',
      log: 'secret log',
    );

    test('sends its fields in the request body', () {
      expect(report.toFields(), {
        'kind': 'bug',
        'message': 'Le son coupe\nau milieu des titres',
        'appVersion': '1.0.0',
        'platform': 'android',
        'osVersion': 'Android 16',
        'songId': 's1',
        'log': 'secret log',
      });
    });

    test('opens a GitHub issue without the log', () {
      final url = report.gitHubIssueUrl();
      expect(url.host, 'github.com');
      expect(url.queryParameters['title'], 'Le son coupe');
      expect(url.queryParameters['labels'], 'bug');
      expect(url.queryParameters['body'], isNot(contains('secret log')));
    });
  });

  testWidgets('a server without reports sends to GitHub, once written',
      (tester) async {
    await tester.pumpWidget(createTestApp(child: const ReportProblemScreen()));
    await tester.pumpAndSettle();

    // The test server is not configured: no "octoReportProblem".
    final button = find.widgetWithText(FilledButton, 'Continue on GitHub');
    expect(button, findsOneWidget);
    expect(tester.widget<FilledButton>(button).onPressed, isNull);

    await tester.enterText(find.byType(TextField), 'Le son coupe');
    await tester.pump();
    expect(tester.widget<FilledButton>(button).onPressed, isNotNull);
  });
}
