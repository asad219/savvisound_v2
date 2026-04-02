import 'package:savvisound_v2/constants/app_colors.dart';
import 'package:savvisound_v2/routes/routes_import.dart';

enum ButtonState { idle, loading, disabled }

class AppButton extends StatefulWidget {
  final String title;
  final TextStyle? titleStyle;
  final ButtonState state;
  final Widget? leadingIcon;
  final Widget? backIcon;
  final List<Color>? gradiant;
  final Function()? onTap;
  final Color? titleColor;
  final double? buttonRadius;
  final double? fontSize;
  final bool? isFontBold;
  final bool isBorder;

  const AppButton({
    super.key,
    required this.title,
    this.titleStyle,
    this.state = ButtonState.idle,
    this.leadingIcon,
    this.backIcon,
    this.gradiant,
    required this.onTap,
    this.titleColor,
    this.buttonRadius,
    this.fontSize = 25,
    this.isFontBold = false,
    this.isBorder = false,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    //final defaultColor = widget.gradiant ?? [AppColors.mainColors.primaryColor, AppColors.mainColors.primaryColor];
    return InkWell(
      onTap: widget.onTap != null
          ? () {
              debugPrint('🔘 AppButton: onTap called for "${widget.title}"');
              widget.onTap!();
            }
          : null,
      child: Container(
        height: 50,
        width: 335,
        decoration: BoxDecoration(
          //color: defaultColor.length < 2 ? defaultColor.first : null,
          //borderRadius: BorderRadius.circular(widget.buttonRadius!),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: widget.isBorder
                ? AppColors.whiteColor
                : AppColors.transparent,
            width: widget.isBorder ? 1 : 0,
          ),
          //gradient: defaultColor.length > 1 ? LinearGradient(colors: defaultColor,): null
          color: AppColors.mainBg.withAlpha(150),
        ),
        child: widget.state == ButtonState.loading
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: AppColors.whiteColor,
                    strokeWidth: 2,
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.backIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: widget.backIcon,
                    ),
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: widget.titleColor,
                      fontSize: widget.fontSize,
                      fontWeight: widget.isFontBold!
                          ? FontWeight.w800
                          : FontWeight.normal,
                    ),
                  ),
                  if (widget.leadingIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: widget.leadingIcon,
                    ),
                ],
              ),
      ),
    );
  }
}
