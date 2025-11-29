import 'package:flutter/material.dart';
import 'package:savvisound_v2/constants/app_colors.dart';

class ChipWidget extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Widget? icon;
  final Color backgroundColor;
  final Color borderColor;
  final Color iconBackgroundColor;
  final double height;
  final double borderRadius;
  final VoidCallback? onTap;

  const ChipWidget({
    super.key,
    this.title = 'CHIPS',
    this.titleStyle,
    this.icon,
    this.backgroundColor = AppColors.mainBg,
    this.borderColor = AppColors.mainBg,
    this.iconBackgroundColor = AppColors.inputBorderColor,
    this.height = 35,
    this.borderRadius = 1,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        padding: const EdgeInsets.only(right: 10),
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: borderColor, width: 1),
        ),
        child: Row(
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: iconBackgroundColor.withAlpha(30),
                shape: BoxShape.circle,
                border: Border.all(
                  color: borderColor.withOpacity(0.6),
                  width: 1,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child:
                    icon ??
                    Image.asset(
                      'assets/images/flutter.png',
                      fit: BoxFit.contain,
                    ),
              ),
            ),

            Text(
              title,
              style:
                  titleStyle ??
                  const TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
