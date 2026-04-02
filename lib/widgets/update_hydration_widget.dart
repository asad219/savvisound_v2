import 'package:flutter/material.dart';
import 'package:savvisound_v2/constants/app_colors.dart';
import 'package:savvisound_v2/widgets/app_button.dart';
import 'package:savvisound_v2/widgets/app_button_outline.dart';
import 'package:savvisound_v2/widgets/app_new_dropdown.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class UpdateHydrationWidget extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const UpdateHydrationWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<UpdateHydrationWidget> createState() => _UpdateHydrationWidgetState();
}

class _UpdateHydrationWidgetState extends State<UpdateHydrationWidget> {
  String _unit = 'ml';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Please select your desired unit',
              style: TextStyle(
                color: AppColors.beigeColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            AppNewDropDown(
              items: const ['ml', 'oz'],
              value: _unit,
              width: 80,
              height: 40,
              fontSize: 14,
              isBorderVisible: true,
              onChanged: (val) {
                if (val == null) return;
                setState(() {
                  _unit = val;
                });
              },
            ),
          ],
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.all(0),
          child: SfSliderTheme(
            data: const SfSliderThemeData(
              tickSize: Size(3, 3),
              tooltipBackgroundColor: AppColors.mainBg,
              activeTickColor: AppColors.beigeColor,
              inactiveTickColor: AppColors.beigeColor,
              activeMinorTickColor: AppColors.beigeColor,
              inactiveMinorTickColor: AppColors.beigeColor,
              activeLabelStyle: TextStyle(
                color: AppColors.beigeColor,
                fontSize: 14,
              ),
              inactiveLabelStyle: TextStyle(
                color: AppColors.beigeColor,
                fontSize: 14,
              ),
            ),
            child: SfSlider(
              value: widget.value,
              min: 10.0,
              max: 100.0,
              interval: 10,
              stepSize: 10,
              showLabels: true,
              showTicks: false,

              enableTooltip: true,
              tooltipShape: const SfPaddleTooltipShape(),
              activeColor: AppColors.beigeColor,
              inactiveColor: AppColors.beigeColor.withAlpha(80),
              labelFormatterCallback: (dynamic actual, String formatted) =>
                  actual.toInt().toString(),
              onChanged: (dynamic newValue) =>
                  widget.onChanged(newValue as double),
            ),
          ),
        ),
        const SizedBox(height: 20),
        AppButtonOutline(
          child: Center(
            child: AppButton(
              title: 'Add Hydration',
              titleColor: AppColors.whiteColor,
              fontSize: 18,
              isFontBold: true,
              onTap: () => widget.onChanged(widget.value),
            ),
          ),
        ),
      ],
    );
  }
}
