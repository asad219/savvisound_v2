import 'package:savvisound_v2/constants/app_colors.dart';
import 'package:savvisound_v2/routes/routes_import.dart';

enum keyboardType { text, numberonly, numberwithdecimal }

class AppTextBox extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? suffixFunc;
  final TextInputType? textInputType;
  final bool? enabled;
  final bool obscureText;
  final bool isSuffixIcon;
  final String? iconName;
  final Widget? customWidget;
  final bool? readonly;
  final Function(String value)? func;
  final void Function()? onTap;
  final String? keyboardType;
  final bool? withDecimal;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final Color hintTextColor;
  final Color labelColor;
  final double fontSize;
  final double? paddingTop;
  final double? paddingBottom;
  final bool isMultiline; // Added multiline option
  final int? maxLines; // Added max lines option
  final int? minLines; // Added min lines option
  final FocusNode? focusNode; // Added focusNode parameter
  final FontWeight? fontWeight;
  final Color? cursorColor; // Added cursor color parameter
  final AutovalidateMode? autovalidateMode; // Added autovalidate mode parameter
  final bool hasError; // Added error state parameter
  final bool? isNumber;

  const AppTextBox({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.validator,
    this.suffixFunc,
    this.textInputType,
    this.enabled = true,
    this.obscureText = false,
    required this.isSuffixIcon,
    this.iconName,
    this.customWidget,
    this.readonly = false,
    this.func,
    this.onTap,
    this.keyboardType = "text",
    this.withDecimal = false,
    this.height = 60,
    this.backgroundColor = Colors.transparent,
    this.textColor = AppColors.textColor,
    this.hintTextColor = AppColors.primaryColor,
    this.labelColor = AppColors.whiteColor,
    this.fontSize = 18,
    this.paddingTop = 0,
    this.paddingBottom = 0,
    this.isMultiline = false, // Default single line
    this.maxLines, // Default null (uses 1 for single line)
    this.minLines, // Default null
    this.focusNode,
    this.fontWeight = FontWeight.bold,
    this.cursorColor =
        AppColors.beigeColor, // Default cursor color for validation
    this.autovalidateMode, // Added autovalidate mode parameter
    this.hasError = false, // Default no error
    this.isNumber = false,
  }); // Added focusNode parameter

  @override
  Widget build(BuildContext context) {
    // Calculate dynamic height for multiline - Increased height calculation
    final double calculatedHeight = isMultiline
        ? (maxLines != null
              ? (maxLines! * fontSize * 2.2) + 80
              : 120) // Increased multiplier and base height
        : height;

    return SizedBox(
      height: isMultiline
          ? null
          : calculatedHeight, // Allow dynamic height for multiline
      child: TextFormField(
        style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
        ),
        cursorColor: hasError
            ? Colors.green
            : cursorColor, // Green cursor on error, otherwise default
        obscureText: obscureText ? true : false,
        autovalidateMode: autovalidateMode ?? AutovalidateMode.disabled,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validator != null
                ? validator!(value)
                : null; // Call validator if provided
          }
          return validator != null ? validator!(value) : null;
        },
        readOnly: readonly!,
        textAlign: isNumber! ? TextAlign.right : TextAlign.left,
        onChanged: (value) => func!(value),
        onTap: onTap,
        keyboardType: _getKeyboardType(),
        controller: controller,
        focusNode: focusNode, // Added focusNode
        textAlignVertical: isMultiline
            ? TextAlignVertical
                  .top // Top align for multiline
            : TextAlignVertical.center, // Center for single line
        // maxLines: _getMaxLines(),
        // minLines: _getMinLines(),
        maxLines: isMultiline
            ? maxLines ?? 5
            : 1, // Increased default max lines
        minLines: isMultiline ? minLines ?? 3 : 1,
        decoration: InputDecoration(
          label: label.isEmpty
              ? null
              : Text(
                  label.toUpperCase(),
                  style: TextStyle(color: labelColor, fontSize: fontSize * 0.8),
                ),
          filled: true,
          fillColor: backgroundColor,
          suffixIcon: !isMultiline
              ? customWidget
              : null, // Hide suffix for multiline
          suffixIconConstraints: const BoxConstraints(
            minHeight: 24,
            minWidth: 24,
          ),
          hintStyle: TextStyle(
            color: hintTextColor.withOpacity(.4),
            fontSize: fontSize,
          ),
          hintText: hintText,
          contentPadding: _getContentPadding(),
          border: textBoxOutlineInputBorder,
          enabledBorder: textBoxOutlineInputBorder,
          focusedBorder: textBoxOutlineInputBorder.copyWith(
            borderSide: const BorderSide(color: AppColors.beigeColor, width: 3),
          ),
          errorBorder: textBoxOutlineInputBorder.copyWith(
            borderSide: const BorderSide(color: AppColors.beigeColor, width: 1),
          ),
          focusedErrorBorder: textBoxOutlineInputBorder.copyWith(
            borderSide: const BorderSide(color: AppColors.beigeColor, width: 3),
          ),
          errorStyle: const TextStyle(height: 0, fontSize: 0),
        ),
      ),
    );
  }

  // Get keyboard type based on parameters
  TextInputType _getKeyboardType() {
    if (isMultiline) {
      return TextInputType.multiline;
    }

    if (keyboardType == "text") {
      return TextInputType.text;
    } else {
      return TextInputType.numberWithOptions(
        decimal: withDecimal,
        signed: false,
      );
    }
  }

  // Get max lines based on multiline setting
  int? _getMaxLines() {
    if (isMultiline) {
      return maxLines ?? 3; // Increased default from 4 to 5 lines
    }
    return 1; // Single line
  }

  // Get min lines based on multiline setting
  int? _getMinLines() {
    if (isMultiline) {
      return minLines ?? 3; // Increased default from 2 to 3 lines
    }
    return 1; // Single line
  }

  // Get content padding based on multiline setting
  EdgeInsets _getContentPadding() {
    if (isMultiline) {
      return const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20, // Increased from 16 to 20 for more padding
      );
    } else {
      return EdgeInsets.symmetric(
        horizontal: 20,
        vertical:
            (height - fontSize) / 2 - 8, // Original calculation for single line
      );
    }
  }
}

const textBoxOutlineInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: AppColors.beigeColor,
    style: BorderStyle.solid,
    width: 1,
  ),
  borderRadius: BorderRadius.all(Radius.circular(15)),
);
