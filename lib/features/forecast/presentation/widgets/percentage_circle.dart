import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:ai_weather/core/utilies/strings/app_strings.dart';
import 'package:ai_weather/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class PercentageCircle extends StatelessWidget {
  final double percentage;
  final String title;
  const PercentageCircle(
      {super.key,
      required this.percentage,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.screenHeight * 0.02,
      children: [
        Text(
          title,
          style: AppTextStyles.title18White,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: context.screenWidth * 0.2,
              height: context.screenHeight * 0.1,
              child: CircularProgressIndicator(
                value: percentage / 50,
                strokeWidth: 6,
                backgroundColor: Colors.white.withOpacity(0.8),
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            Column(
              children: [
                Text(
                  (percentage).toStringAsFixed(1),
                  style: AppTextStyles.title20WhiteW500,
                ),
                Text(
                  AppStrings.celsius,
                  style: AppTextStyles.title12White,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
