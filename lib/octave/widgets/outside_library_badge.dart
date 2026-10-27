import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

/// Marks a song that is not in the library: Octo finds it outside (search,
/// mixes) and streams it from there. A small globe before the artist name;
/// the server no longer stamps its own badge on the cover for Octave.
class OutsideLibraryBadge extends StatelessWidget {
  const OutsideLibraryBadge({super.key, required this.color, this.size = 12});

  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    final label = AppLocalizations.of(context)!.outsideLibrary;
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 4),
      child: Tooltip(
        message: label,
        child: Icon(
          CupertinoIcons.globe,
          size: size,
          color: color,
          semanticLabel: label,
        ),
      ),
    );
  }
}

/// [text] after an [OutsideLibraryBadge] when [outside] is true.
Widget withOutsideBadge({
  required bool outside,
  required Text text,
  required Color badgeColor,
  double badgeSize = 12,
}) {
  if (!outside) return text;
  return Row(
    children: [
      OutsideLibraryBadge(color: badgeColor, size: badgeSize),
      Flexible(child: text),
    ],
  );
}
