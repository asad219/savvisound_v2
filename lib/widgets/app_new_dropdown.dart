import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:savvisound_v2/constants/app_colors.dart';
import 'package:savvisound_v2/constants/app_constants.dart';
import 'package:savvisound_v2/routes/routes_import.dart';

class AppNewDropDown extends StatelessWidget {
  final List<String> items;
  final String value;
  final ValueChanged<String?> onChanged;
  final double width;
  final double height;
  final double fontSize;
  final bool? isBorderVisible;
  final String? fontFamily;

  const AppNewDropDown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.width = 100,
    this.height = 50,
    this.fontSize = 18,
    this.isBorderVisible = true,
    this.fontFamily = AppConstants.fontFamilyName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Column(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              style: TextStyle(
                color: AppColors.beigeColor,
                fontWeight: FontWeight.bold,
                fontSize: fontSize,
                fontFamily: fontFamily,
              ),
              isExpanded: true,
              buttonStyleData: ButtonStyleData(
                height: height,
                width: width,
                padding: const EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: isBorderVisible == true
                      ? Border.all(color: AppColors.beigeColor)
                      : null,
                  color: AppColors.mainBg.withAlpha(250),
                ),
                elevation: 0,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: width,
                padding: null,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: AppColors.mainBg.withAlpha(250),
                ),
                elevation: 8,
                offset: const Offset(0, 0),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: WidgetStateProperty.all(6),
                  thumbVisibility: WidgetStateProperty.all(true),
                ),
              ),
              iconStyleData: const IconStyleData(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.beigeColor,
                ),
                iconSize: 30,
              ),
              items: items
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Center(
                        child: Text(
                          item,
                          style: TextStyle(
                            fontFamily: fontFamily,
                            color: AppColors.beigeColor,
                            fontSize: fontSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
              value: value,
            ),
          ),
        ],
      ),
    );
  }
}
