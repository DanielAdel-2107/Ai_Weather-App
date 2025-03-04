import 'package:ai_weather/core/app_route/route_names.dart';
import 'package:ai_weather/core/components/custom_elevated_button.dart';
import 'package:ai_weather/core/utilies/colors/app_colors.dart';
import 'package:ai_weather/core/utilies/constants/app_size.dart';
import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:ai_weather/core/utilies/strings/app_Strings.dart';
import 'package:ai_weather/features/splash/presentation/widgets/custom_clip_path.dart';
import 'package:flutter/material.dart';

class ShadowAndSkipButton extends StatelessWidget {
  const ShadowAndSkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: AppSize.h0(context),
      right: AppSize.w0(context),
      left: AppSize.w0(context),
      child: ClipPath(
        clipper: CustomClipPath(),
        child: Container(
          padding:  EdgeInsets.symmetric(
              horizontal: AppSize.padding32(context), vertical: AppSize.padding16(context)),
          height: context.screenHeight / 2,
          width: context.screenWidth,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primaryColor,
                AppColors.primaryColor,
                AppColors.primaryColor,
                AppColors.primaryColor,
                Colors.transparent,
                Colors.transparent,
              ],
              begin: Alignment.bottomRight,
              end: Alignment.topCenter,
            ),
          ),
          alignment: Alignment.bottomRight,
          child: CustomElevatedButton(
            onPressed: () {
              context.pushScreen(RouteNames.loginOrSignupScreen);
            },
            name: AppStrings.skip,
          ),
        ),
      ),
    );
  }
}
