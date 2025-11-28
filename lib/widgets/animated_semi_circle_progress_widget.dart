import 'dart:math';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AnimatedSemiCircleProgress extends StatefulWidget {
  final double progress; // 0–1
  final double strokeWidth;
  final Color color;
  final Duration duration;
  final IconData startIcon;
  final IconData endIcon;

  const AnimatedSemiCircleProgress({
    super.key,
    required this.progress,
    this.strokeWidth = 14,
    this.color = Colors.blue,
    this.duration = const Duration(seconds: 2),
    this.startIcon = Iconsax.home_2,
    this.endIcon = Iconsax.drop,
  });

  @override
  State<AnimatedSemiCircleProgress> createState() =>
      _AnimatedSemiCircleProgressState();
}

class _AnimatedSemiCircleProgressState extends State<AnimatedSemiCircleProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: widget.duration);

    animation = Tween<double>(
      begin: 0,
      end: widget.progress,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (_, __) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            /// Semi-circle painter
            CustomPaint(
              painter: _AnimatedSemiCirclePainter(
                animation.value,
                widget.strokeWidth,
                widget.color,
              ),
              child: SizedBox(width: 250, height: 125),
            ),

            /// Center text
            // Positioned(
            //   bottom: 20,
            //   child: Text(
            //     "${(animation.value * 100).toInt()}",
            //     style: TextStyle(
            //       fontSize: 22,
            //       color: widget.color,
            //       fontWeight: FontWeight.w600,
            //     ),
            //   ),
            // ),

            /// LEFT ICON (Start of arc)
            Positioned(
              left: -15,
              bottom: -40,
              child: Icon(widget.startIcon, size: 28, color: widget.color),
            ),

            /// RIGHT ICON (End of arc)
            Positioned(
              right: -15,
              bottom: -40,
              child: Icon(widget.endIcon, size: 28, color: widget.color),
            ),
          ],
        );
      },
    );
  }
}

class _AnimatedSemiCirclePainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final Color color;

  _AnimatedSemiCirclePainter(this.progress, this.strokeWidth, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);

    final basePaint = Paint()
      ..color = color.withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    /// Base arc
    canvas.drawArc(rect, pi, pi, false, basePaint);

    /// Progress arc
    canvas.drawArc(rect, pi, pi * progress, false, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
