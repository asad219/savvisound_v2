import 'package:flutter/material.dart';
import 'package:savvisound_v2/constants/app_colors.dart';
import 'package:savvisound_v2/widgets/app_button.dart';
import 'package:savvisound_v2/widgets/app_button_outline.dart';
import 'package:savvisound_v2/widgets/app_textbox.dart';

class UpdateNotesWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const UpdateNotesWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppTextBox(
          label: '',
          hintText: 'Write any notes here...',
          controller: controller,
          isSuffixIcon: false,
          isMultiline: true,
          maxLines: 4,
          minLines: 3,
          backgroundColor: AppColors.mainBg.withAlpha(30),
          textColor: AppColors.whiteColor,
          hintTextColor: AppColors.beigeColor.withAlpha(50),
          labelColor: AppColors.mainBg,
          cursorColor: AppColors.whiteColor,
          func: (text) => onChanged(text),
        ),
        const SizedBox(height: 12),
        AppButtonOutline(
          child: Center(
            child: AppButton(
              title: 'Update Notes',
              titleColor: AppColors.whiteColor,
              fontSize: 18,
              isFontBold: true,
              onTap: () => onChanged(controller.text),
            ),
          ),
        ),
      ],
    );
  }
}
