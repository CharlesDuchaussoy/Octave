import 'package:flutter/material.dart';
import 'package:musly/theme/app_theme.dart';
import 'package:musly/widgets/common/album_artwork.dart';

class MediaCard extends StatefulWidget {
  final String? coverArt;
  final Widget? artwork;
  final String title;
  final String? subtitle;
  final VoidCallback? onTap;
  final VoidCallback? onPlayPressed;
  final double size;
  final bool isRound;

  const MediaCard({
    super.key,
    this.coverArt,
    this.artwork,
    required this.title,
    this.subtitle,
    this.onTap,
    this.onPlayPressed,
    this.size = 180,
    this.isRound = false,
  });

  @override
  State<MediaCard> createState() => _MediaCardState();
}

class _MediaCardState extends State<MediaCard> {
  bool _isHovered = false;
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // The keyboard focus border takes 3 px on each side.
    final artSize = widget.size - 6;
    final radius = widget.isRound ? artSize / 2 : 8.0;
    return RepaintBoundary(
      child: FocusableActionDetector(
        onShowFocusHighlight: (focused) {
          setState(() => _isFocused = focused);
          if (focused) {
            Scrollable.ensureVisible(context,
                alignment: 0.5, duration: const Duration(milliseconds: 300));
          }
        },
        actions: {
          ActivateIntent: CallbackAction<ActivateIntent>(
            onInvoke: (_) {
              if (widget.onTap != null) {
                widget.onTap!();
              } else if (widget.onPlayPressed != null) {
                widget.onPlayPressed!();
              }
              return null;
            },
          ),
        },
        child: MouseRegion(
          onEnter: (_) => setState(() => _isHovered = true),
          onExit: (_) => setState(() => _isHovered = false),
          child: GestureDetector(
            onTap: widget.onTap,
            // Apple Music style: the artwork itself is the card, with no
            // frame around it, and the text sits under it.
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              width: widget.size,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(radius + 3),
                border: Border.all(
                  color: _isFocused ? context.octave.accent : Colors.transparent,
                  width: 3.0,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: widget.isRound
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  AnimatedScale(
                    scale: (_isHovered || _isFocused) ? 1.04 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeOut,
                    child: SizedBox.square(
                      dimension: artSize,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(radius),
                            child: widget.artwork ??
                                AlbumArtwork(
                                  coverArt: widget.coverArt,
                                  size: artSize,
                                  borderRadius: radius,
                                ),
                          ),
                          if (_isHovered && widget.onPlayPressed != null)
                            Positioned(
                              bottom: 8,
                              right: 8,
                              child: _PlayButton(
                                onPressed: widget.onPlayPressed!,
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.title,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: context.octave.text1,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign:
                        widget.isRound ? TextAlign.center : TextAlign.start,
                  ),
                  if (widget.subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(
                      widget.subtitle!,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: context.octave.text2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign:
                          widget.isRound ? TextAlign.center : TextAlign.start,
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PlayButton extends StatefulWidget {
  final VoidCallback onPressed;

  const _PlayButton({required this.onPressed});

  @override
  State<_PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<_PlayButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: context.octave.accent,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.onPressed,
              customBorder: const CircleBorder(),
              child: Icon(
                Icons.play_arrow_rounded,
                color: context.octave.onAccent,
                size: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
