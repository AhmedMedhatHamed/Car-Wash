import 'package:flutter/material.dart';

class LoadingDots extends StatefulWidget {
  const LoadingDots({
    super.key,
    this.dotCount = 3,
    this.dotSize = 8,
    this.spacing = 10,
    this.color = Colors.white,
    this.duration = const Duration(milliseconds: 1200),
  });

  final int dotCount;
  final double dotSize;
  final double spacing;
  final Color color;
  final Duration duration;

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.dotCount, (index) {
            final delay = index / widget.dotCount;
            final t = (_controller.value - delay) % 1.0;

            final progress = t < 0.5 ? t / 0.5 : 1 - ((t - 0.5) / 0.5);
            final scale = 0.7 + (0.45 * progress);
            final opacity = 0.35 + (0.65 * progress);

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: widget.spacing / 2),
              child: Transform.scale(
                scale: scale,
                child: Container(
                  width: widget.dotSize,
                  height: widget.dotSize,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.color.withOpacity(opacity),
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
