import 'package:ai_weather/core/utilies/colors/app_colors.dart';
import 'package:ai_weather/core/utilies/constants/app_size.dart';
import 'package:ai_weather/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class GenderType extends StatelessWidget {
  const GenderType({
    super.key,
    required this.gender,
    required this.isSelected,
    this.onTap,
  });
  final String gender;
  final bool isSelected;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(AppSize.padding16(context)),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondryColor : AppColors.greyColor,
          borderRadius: BorderRadius.circular(AppSize.r16(context)),
        ),
        child: Center(
          child: Text(
            gender,
            style: AppTextStyles.title18White,
          ),
        ),
      ),
    ));
  }
}
