import 'dart:async';
import 'package:flutter/material.dart';

/// One line of text that scrolls slowly when it does not fit, as in the
/// players of Apple Music and Spotify. Its edges fade out instead of
/// cutting a letter in half. With animations turned off in the system
/// settings, it ends with an ellipsis instead of scrolling.
class MarqueeText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final double pauseDuration;
  final double scrollVelocity;

  const MarqueeText({
    super.key,
    required this.text,
    this.style,
    this.pauseDuration = 2.0,
    this.scrollVelocity = 30.0,
  });

  @override
  State<MarqueeText> createState() => _MarqueeTextState();
}

class _MarqueeTextState extends State<MarqueeText> {
  static const double _gap = 40;
  static const double _fadeWidth = 24;

  final ScrollController _scrollController = ScrollController();
  Timer? _timer;
  bool _needsScroll = false;

  /// What the text was last measured for: width, animations, text scale.
  Object? _measuredFor;

  /// Bumped on each start or stop, so an older scroll loop ends by itself.
  int _run = 0;

  @override
  void didUpdateWidget(covariant MarqueeText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text || oldWidget.style != widget.style) {
      _measuredFor = null;
      _stopScroll();
    }
  }

  /// Measures the text as [Text] draws it: with the inherited style (the
  /// app font) and the system text scale, not with [MarqueeText.style]
  /// alone.
  bool _overflows(BuildContext context, double maxWidth) {
    final painter = TextPainter(
      text: TextSpan(
        text: widget.text,
        style: DefaultTextStyle.of(context).style.merge(widget.style),
      ),
      maxLines: 1,
      textDirection: Directionality.of(context),
      textScaler: MediaQuery.textScalerOf(context),
    )..layout();
    final overflows = painter.width > maxWidth;
    painter.dispose();
    return overflows;
  }

  void _startScroll() {
    _stopScroll();
    final run = _run;
    _timer = Timer(
      Duration(milliseconds: (widget.pauseDuration * 1000).toInt()),
      () => _scroll(run),
    );
  }

  Future<void> _scroll(int run) async {
    if (!mounted || run != _run || !_scrollController.hasClients) return;

    final maxScrollExtent = _scrollController.position.maxScrollExtent;
    await _scrollController.animateTo(
      maxScrollExtent,
      duration: Duration(
          milliseconds:
              (maxScrollExtent / widget.scrollVelocity * 1000).toInt()),
      curve: Curves.linear,
    );
    if (!mounted || run != _run) return;
    // Rest at the end, then start over.
    _timer = Timer(
      Duration(milliseconds: (widget.pauseDuration * 1000).toInt()),
      () {
        if (mounted && run == _run) _startScroll();
      },
    );
  }

  void _stopScroll() {
    _run++;
    _timer?.cancel();
    if (_scrollController.hasClients) {
      _scrollController.jumpTo(0.0);
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animate = !MediaQuery.of(context).disableAnimations;
    final scaler = MediaQuery.textScalerOf(context);

    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      final key = (width, animate, scaler);
      if (key != _measuredFor) {
        _measuredFor = key;
        _needsScroll = animate && _overflows(context, width);
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          _needsScroll ? _startScroll() : _stopScroll();
        });
      }

      if (!_needsScroll) {
        return Text(
          widget.text,
          style: widget.style,
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        );
      }

      final edge = (_fadeWidth / width).clamp(0.0, 0.5);
      return ListenableBuilder(
        listenable: _scrollController,
        builder: (context, child) {
          // The start fades only once the text has moved.
          final moved =
              _scrollController.hasClients && _scrollController.offset > 0;
          return ShaderMask(
            blendMode: BlendMode.dstIn,
            shaderCallback: (rect) => LinearGradient(
              colors: [
                moved ? Colors.transparent : Colors.black,
                Colors.black,
                Colors.black,
                Colors.transparent,
              ],
              stops: [0, edge, 1 - edge, 1],
            ).createShader(rect),
            child: child,
          );
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.text, style: widget.style, maxLines: 1),
              const SizedBox(width: _gap),
            ],
          ),
        ),
      );
    });
  }
}
