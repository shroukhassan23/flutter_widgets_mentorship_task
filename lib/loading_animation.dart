import 'package:flutter/material.dart';

class LoadingAnimation extends StatefulWidget {
  final double dotSize;
  final double maxScale;

  final Color color;
  const LoadingAnimation({
    super.key,
    this.dotSize = 12.0,
    this.maxScale = 1.6,

    this.color = Colors.blue,
  });

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final List<Animation<double>> _animations;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..repeat(reverse: true);
    final intervals = [
      const Interval(0.0, 0.33, curve: Curves.easeOut),
      const Interval(0.33, 0.66, curve: Curves.easeOut),
      const Interval(0.66, 1.0, curve: Curves.easeOut),
    ];
    _animations = intervals.map((interval) {
      return CurvedAnimation(parent: _controller, curve: interval);
    }).toList();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(Animation<double> animation) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        double scale;

        if (_controller.status == AnimationStatus.reverse) {
          // Phase 2: كلهم بيصغروا مع بعض
          scale = 1 + (widget.maxScale - 1) * _controller.value;
        } else {
          // Phase 1: كل نقطة تكبر بوقت مختلف
          scale = 1 + (widget.maxScale - 1) * animation.value;
        }

        return Transform.scale(scale: scale, child: child);
      },
      child: Container(
        width: widget.dotSize,
        height: widget.dotSize,
        decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildDot(_animations[0]),
            const SizedBox(width: 8),
            _buildDot(_animations[1]),
            const SizedBox(width: 8),
            _buildDot(_animations[2]),
          ],
        ),
      ),
    );
  }
}
