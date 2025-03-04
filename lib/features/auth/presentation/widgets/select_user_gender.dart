import 'package:ai_weather/core/utilies/constants/app_size.dart';
import 'package:ai_weather/core/utilies/strings/app_strings.dart';
import 'package:ai_weather/core/utilies/styles/app_text_styles.dart';
import 'package:ai_weather/features/auth/presentation/widgets/gender_type.dart';
import 'package:flutter/material.dart';

class SelectUserGender extends StatelessWidget {
  const SelectUserGender({
    super.key,
    required this.genderType,
    this.onTapMale,
    this.onTapFemale,
  });

  final int genderType;
  final Function()? onTapMale;
  final Function()? onTapFemale;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.selectGender,
          style: AppTextStyles.title20WhiteW500,
        ),
        Row(
          spacing: AppSize.w10(context),
          children: [
            GenderType(
                gender: AppStrings.male,
                isSelected: genderType == 1,
                onTap: onTapMale),
            GenderType(
                gender: AppStrings.female,
                isSelected: genderType == 2,
                onTap: onTapFemale),
          ],
        )
      ],
    );
  }
}
