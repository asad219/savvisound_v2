import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:savvisound_v2/constants/app_colors.dart';
import 'package:savvisound_v2/routes/routes_import.dart';

class AppButtonOutline extends StatefulWidget {
  Widget child;
  double? width;
  double? height;
  double? radius;
  Color? color;
  AppButtonOutline({
    super.key,
    required this.child,
    this.width = 335,
    this.height = 50,
    this.radius = 15,
    this.color = AppColors.whiteColor,
  });

  @override
  State<AppButtonOutline> createState() => _AppButtonOutlineState();
}

class _AppButtonOutlineState extends State<AppButtonOutline> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: AppColors.mainBg,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(widget.radius!),
          border: const GradientBoxBorder(
            width: 3,
            gradient: LinearGradient(
              colors: [
                Color(0xFFBE3432),
                Color(0xFFDFA542),
                Color(0xFF50B334),
                Color(0xFF0000F4),
                Color(0xFF000000),
              ],
            ),
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
