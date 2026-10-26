import 'package:flutter/material.dart';

import '../theme/octave_theme.dart';

/// Play or shuffle button under album, playlist and artist headers.
///
/// The [filled] one (Play) takes the accent color, so the chosen color
/// shows on every collection; the other one gets the soft accent.
class OctavePlayButton extends StatelessWidget {
  const OctavePlayButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.filled = false,
    this.autofocus = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool filled;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    final background = filled ? colors.accent : colors.accentSoft;
    final foreground = filled ? colors.onAccent : colors.onAccentSoft;

    return Material(
      color: background,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        autofocus: autofocus,
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: foreground, size: 20),
              const SizedBox(width: 6),
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    label,
                    style: TextStyle(
                      color: foreground,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
