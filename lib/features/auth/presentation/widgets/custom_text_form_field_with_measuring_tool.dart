import 'package:ai_weather/core/components/custom_text_form_field_with_title.dart';
import 'package:ai_weather/core/utilies/colors/app_colors.dart';
import 'package:ai_weather/core/utilies/constants/app_size.dart';
import 'package:ai_weather/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldWithMeasuringTool extends StatelessWidget {
  const CustomTextFormFieldWithMeasuringTool({
    super.key,
    required this.title,
   required this.controller,
    required this.measuringTool,
  });
  final String title;
  final TextEditingController controller;
  final String measuringTool;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: AppSize.h10(context),
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          flex: 8,
          child: CustomTextFormFieldWithTitle(
            title: title.toUpperCase(),
            controller: controller,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: AppSize.padding16(context),
                vertical: AppSize.padding16(context)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greyColor,
            ),
            child: Center(
              child: Text(
                measuringTool,
                style: AppTextStyles.title20WhiteW500,
              ),
            ),
          ),
        )
      ],
    );
  }
}
