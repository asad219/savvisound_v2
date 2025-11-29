import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:savvisound_v2/constants/app_colors.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onHamburgerTap;
  final VoidCallback? onFontSizeTap;
  final bool showFontSizeIcon;
  final Color? iconColor;
  final Duration animationDuration;
  final Duration animationDelay;
  final bool isDashboard;
  final String? title;

  const DashboardAppBar({
    super.key,
    this.onHamburgerTap,
    this.onFontSizeTap,
    this.showFontSizeIcon = false,
    this.iconColor,
    this.animationDuration = const Duration(milliseconds: 800),
    this.animationDelay = const Duration(milliseconds: 400),
    this.isDashboard = false,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final color = iconColor ?? AppColors.mainBg;

    return AppBar(
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(
                color: AppColors.mainBg,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            )
          : null,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leadingWidth: 100,
      leading: isDashboard == false
          ? null
          : Padding(
              padding: const EdgeInsets.only(left: 18.0),
              child: Image.asset('assets/images/savvi-sound-logo.png'),
            ).fadeIn(duration: animationDuration, delay: animationDelay),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Row(
            children: [
              if (showFontSizeIcon) ...[
                GestureDetector(
                  onTap: onFontSizeTap,
                  child: SvgPicture.asset(
                    'assets/icons/font-size.svg',
                    height: 40,
                    colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                  ).fadeIn(duration: animationDuration, delay: animationDelay),
                ),
                const SizedBox(width: 8),
              ],
              GestureDetector(
                onTap: onHamburgerTap,
                child: SvgPicture.asset(
                  'assets/icons/hamburger.svg',
                  height: 40,
                  colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                ).fadeIn(duration: animationDuration, delay: animationDelay),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
