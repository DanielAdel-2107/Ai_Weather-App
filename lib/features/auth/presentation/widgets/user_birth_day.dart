import 'package:ai_weather/core/components/custom_text_form_field_with_title.dart';
import 'package:ai_weather/core/utilies/constants/app_size.dart';
import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:ai_weather/core/utilies/strings/app_strings.dart';
import 'package:ai_weather/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class UserBirthDay extends StatelessWidget {
  const UserBirthDay({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: AppSize.padding16(context)),
          child: Text(
            AppStrings.birthDay.toUpperCase(),
            style: AppTextStyles.title20WhiteW500,
          ),
        ),
        Row(
          spacing: AppSize.h10(context),
          children: [
            Expanded(
              child: CustomTextFormFieldWithTitle(
                hintText: AppStrings.yyyy.toUpperCase(),
                textAlign: TextAlign.center,
                maxLength: 4,
                controller: context.signUpCubit.yearController,
              ),
            ),
            Expanded(
              child: CustomTextFormFieldWithTitle(
                hintText: AppStrings.mm.toUpperCase(),
                textAlign: TextAlign.center,
                maxLength: 2,
                controller: context.signUpCubit.monthController,
              ),
            ),
            Expanded(
              child: CustomTextFormFieldWithTitle(
                hintText: AppStrings.dd.toUpperCase(),
                textAlign: TextAlign.center,
                maxLength: 2,
                controller: context.signUpCubit.dayController,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
