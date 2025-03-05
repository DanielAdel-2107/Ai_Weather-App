import 'package:ai_weather/core/utilies/strings/app_Strings.dart';
import 'package:ai_weather/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomLoginTitle extends StatelessWidget {
  const CustomLoginTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStrings.login.toUpperCase(),
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
