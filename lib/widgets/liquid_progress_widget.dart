import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';

class LiquidProgressWidget extends StatelessWidget {
  final double progress; // 0.0 to 1.0
  final String displayText;
  final double size;
  final Color progressColor;
  final Color backgroundColor;
  final Color borderColor;
  final double borderWidth;
  final IconData bottomIcon;
  final double bottomIconSize;
  final Color bottomIconColor;

  const LiquidProgressWidget({
    super.key,
    required this.progress,
    required this.displayText,
    this.size = 200,
    this.progressColor = Colors.blue,
    Color? backgroundColor,
    Color? borderColor,
    this.borderWidth = 4.0,
    this.bottomIcon = Icons.local_drink_outlined,
    this.bottomIconSize = 40,
    Color? bottomIconColor,
  }) : backgroundColor = backgroundColor ?? const Color(0xFFE3F2FD),
       borderColor = borderColor ?? const Color(0xFFBBDEFB),
       bottomIconColor = bottomIconColor ?? const Color(0xFF1976D2);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: size,
          width: size,
          child: LiquidCircularProgressIndicator(
            value: progress,
            valueColor: AlwaysStoppedAnimation(progressColor),
            backgroundColor: backgroundColor,
            borderColor: borderColor,
            borderWidth: borderWidth,
            direction: Axis.vertical,
            center: Text(
              displayText,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Positioned(
          bottom: -20,
          left: (size - 60) / 2,
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: borderColor, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              bottomIcon,
              size: bottomIconSize,
              color: bottomIconColor,
            ),
          ),
        ),
      ],
    );
  }
}
