import 'package:ai_weather/core/utilies/constants/app_size.dart';
import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:ai_weather/core/utilies/strings/app_Strings.dart';
import 'package:ai_weather/features/auth/presentation/widgets/custom_text_form_field_with_measuring_tool.dart';
import 'package:ai_weather/features/auth/presentation/widgets/user_birth_day.dart';
import 'package:flutter/material.dart';

class SignupScreenSecondStep extends StatelessWidget {
  const SignupScreenSecondStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: AppSize.h5(context),
      children: [
        UserBirthDay(),
        CustomTextFormFieldWithMeasuringTool(
          title: AppStrings.length,
          controller: context.signUpCubit.lenghtController,
          measuringTool: AppStrings.cm,
        ),
        CustomTextFormFieldWithMeasuringTool(
          title: AppStrings.weight,
          controller: context.signUpCubit.weightController,
          measuringTool: AppStrings.kg,
        ),
      ],
    );
  }
}

