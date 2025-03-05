import 'package:ai_weather/core/app_route/route_names.dart';
import 'package:ai_weather/core/components/custom_elevated_button.dart';
import 'package:ai_weather/core/utilies/colors/app_colors.dart';
import 'package:ai_weather/core/utilies/constants/app_size.dart';
import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:ai_weather/core/utilies/strings/app_Strings.dart';
import 'package:ai_weather/core/utilies/styles/app_text_styles.dart';
import 'package:ai_weather/features/auth/presentation/widgets/custom_clip_path.dart';
import 'package:flutter/material.dart';

class LoginOrSignupScreenBody extends StatelessWidget {
  const LoginOrSignupScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipPath(
          clipper: CustomClipPath(),
          child: Container(
            height: context.screenHeight / 1.4,
            color: Colors.white,
          ),
        ),
        CustomElevatedButton(
          name: AppStrings.sign_up,
          onPressed: () {
            context.pushScreen(RouteNames.signUpScreen);
          },
          backgroundColor: AppColors.secondryColor,
          textStyle: AppTextStyles.title28WhiteW500,
          width: context.screenWidth / 1.3,
          height: context.screenHeight * 0.07,
        ),
        SizedBox(height: AppSize.h16(context)),
        CustomElevatedButton(
          name: AppStrings.log_In,
          width: context.screenWidth / 1.3,
          height: context.screenHeight * 0.07,
          onPressed: () {
            context.pushScreen(RouteNames.loginScreen);
          },
          textStyle: AppTextStyles.title28PrimaryColorW500,
        ),
      ],
    );
  }
}
