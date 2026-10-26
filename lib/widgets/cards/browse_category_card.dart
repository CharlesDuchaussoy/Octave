import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

/// "Browse all" tile of the search screen: a plain color, the title, and
/// a tilted picture or icon in the corner. The color is one of Octave's
/// named colors, darkened so white text stays readable.
class BrowseCategoryCard extends StatefulWidget {
  final String title;
  final Color color;
  final IconData? icon;
  final String? imageUrl;
  final VoidCallback onTap;

  const BrowseCategoryCard({
    super.key,
    required this.title,
    required this.color,
    this.icon,
    this.imageUrl,
    required this.onTap,
  });

  /// [seed] at tone 38: deep enough for white text (WCAG AA), whatever
  /// its hue.
  static Color tileColor(Color seed) {
    final hct = Hct.fromInt(seed.toARGB32());
    return Color(Hct.from(hct.hue, math.max(hct.chroma, 36), 38).toInt());
  }

  @override
  State<BrowseCategoryCard> createState() => _BrowseCategoryCardState();
}

class _BrowseCategoryCardState extends State<BrowseCategoryCard> {
  bool _isHovered = false;

  static const _onTile = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    final tile = BrowseCategoryCard.tileColor(widget.color);
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.02 : 1.0,
        duration: const Duration(milliseconds: 150),
        child: Material(
          color: tile,
          borderRadius: BorderRadius.circular(10),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: widget.onTap,
            child: SizedBox(
              height: 100,
              child: Stack(
                children: [
                  Positioned(
                    top: 14,
                    left: 14,
                    right: 48,
                    child: Text(
                      widget.title,
                      style: const TextStyle(
                        color: _onTile,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Positioned(
                    right: -10,
                    bottom: -6,
                    child: Transform.rotate(
                      angle: 0.42,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: SizedBox.square(
                          dimension: 68,
                          child: widget.imageUrl != null
                              ? CachedNetworkImage(
                                  imageUrl: widget.imageUrl!,
                                  fit: BoxFit.cover,
                                  errorWidget: (_, __, ___) =>
                                      _buildFallbackIcon(),
                                )
                              : _buildFallbackIcon(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFallbackIcon() {
    return ColoredBox(
      color: _onTile.withValues(alpha: 0.16),
      child: Center(
        child: Icon(
          widget.icon ?? Icons.music_note,
          color: _onTile.withValues(alpha: 0.92),
          size: 32,
        ),
      ),
    );
  }
}
