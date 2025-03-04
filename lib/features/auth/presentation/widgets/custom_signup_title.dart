import 'package:ai_weather/core/utilies/strings/app_Strings.dart';
import 'package:ai_weather/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSignUpTitle extends StatelessWidget {
  const CustomSignUpTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.sign_up.toUpperCase(),
          style: AppTextStyles.title42WhiteW500,
        ),
        Text(
          AppStrings.createAnAccount.toUpperCase(),
          style: AppTextStyles.title16White300,
        ),
      ],
    );
  }
}
