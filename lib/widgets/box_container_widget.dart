import 'package:flutter/material.dart';
import 'package:savvisound_v2/constants/app_colors.dart';

class BoxContainerWidget extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final bool useRowLayout;
  final String boxTitle;
  final Widget? titleWidget;

  const BoxContainerWidget({
    super.key,
    required this.child,
    this.width = double.infinity,
    this.height,
    this.backgroundColor = AppColors.mainBg,
    this.borderRadius = 20.0,
    this.padding = const EdgeInsets.all(16.0),
    this.margin = const EdgeInsets.all(0.0),
    this.border,
    this.boxShadow,
    this.useRowLayout = true,
    this.boxTitle = '',
    this.titleWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              boxTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.mainBg,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: titleWidget ?? const SizedBox.shrink(),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        Container(
          width: width,
          height: (height != null && height!.isFinite) ? height : null,
          padding: padding,
          margin: margin,
          decoration: BoxDecoration(
            color: backgroundColor.withAlpha(20),
            borderRadius: BorderRadius.circular(borderRadius),
            border: border,
            boxShadow: boxShadow,
          ),
          child: child,
        ),
      ],
    );
  }
}
