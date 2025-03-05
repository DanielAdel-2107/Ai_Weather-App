import 'package:ai_weather/core/app_route/route_names.dart';
import 'package:ai_weather/core/components/custom_elevated_button.dart';
import 'package:ai_weather/core/components/custom_text_button.dart';
import 'package:ai_weather/core/components/custom_text_form_field_with_title.dart';
import 'package:ai_weather/core/di/dependancy_injection.dart';
import 'package:ai_weather/core/helper/show_custom_dialog.dart';
import 'package:ai_weather/core/utilies/colors/app_colors.dart';
import 'package:ai_weather/core/utilies/constants/app_size.dart';
import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:ai_weather/core/utilies/strings/app_Strings.dart';
import 'package:ai_weather/core/utilies/styles/app_text_styles.dart';
import 'package:ai_weather/features/auth/presentation/controller/sign_in/sign_in_cubit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserLogInForm extends StatelessWidget {
  const UserLogInForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<SignInCubit>(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInSuccess) {
            showCustomDialog(
              title: AppStrings.success,
              description: AppStrings.login,
              dialogType: DialogType.error,
            );
            context.pushScreen(RouteNames.forecastScreen);
          }
          if (state is SignInFailed) {
            showCustomDialog(
              title: AppStrings.failure,
              description: state.error,
              dialogType: DialogType.error,
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: context.signInCubit.formKey,
            child: Column(
              children: [
                CustomTextFormFieldWithTitle(
                  title: AppStrings.email,
                  controller: context.signInCubit.emailController,
                ),
                SizedBox(
                  height: AppSize.h16(context),
                ),
                CustomTextFormFieldWithTitle(
                  title: AppStrings.password,
                  controller: context.signInCubit.passwordController,
                  isPassword: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomTextButton(
                      title: AppStrings.forgetPassword,
                      onPressed: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: AppSize.h32(context),
                ),
                state is SignInLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : CustomElevatedButton(
                        name: AppStrings.login.toUpperCase(),
                        onPressed: () {
                          context.signInCubit.signIn();
                        },
                        width: context.screenWidth / 1.2,
                        height: context.screenHeight * 0.07,
                        backgroundColor: AppColors.secondryColor,
                        textStyle: AppTextStyles.title28WhiteW500,
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextButton(
                      title: AppStrings.dontHaveAnAccount.toUpperCase(),
                      onPressed: () {
                        context.pushScreen(RouteNames.signUpScreen);
                      },
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
