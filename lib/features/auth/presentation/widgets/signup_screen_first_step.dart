import 'package:ai_weather/core/components/custom_text_form_field_with_title.dart';
import 'package:ai_weather/core/utilies/constants/app_size.dart';
import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:ai_weather/core/utilies/strings/app_Strings.dart';
import 'package:flutter/material.dart';

class SignupScreenFristStep extends StatelessWidget {
  const SignupScreenFristStep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: AppSize.h5(context),
      children: [
        CustomTextFormFieldWithTitle(
          title: AppStrings.full_name,
          controller: context.signUpCubit.fullNameController,
        ),
        CustomTextFormFieldWithTitle(
          title: AppStrings.email,
          controller: context.signUpCubit.emailController,
        ),
        CustomTextFormFieldWithTitle(
          title: AppStrings.password,
          controller: context.signUpCubit.passwordController,
          isPassword: true,
        ),
      ],
    );
  }
}
