import 'package:ai_weather/core/app_route/route_names.dart';
import 'package:ai_weather/core/components/custom_elevated_button.dart';
import 'package:ai_weather/core/components/custom_text_button.dart';
import 'package:ai_weather/core/di/dependancy_injection.dart';
import 'package:ai_weather/core/helper/show_custom_dialog.dart';
import 'package:ai_weather/core/utilies/colors/app_colors.dart';
import 'package:ai_weather/core/utilies/constants/app_size.dart';
import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:ai_weather/core/utilies/strings/app_Strings.dart';
import 'package:ai_weather/core/utilies/styles/app_text_styles.dart';
import 'package:ai_weather/features/auth/presentation/controller/sign_up/sign_up_cubit.dart';
import 'package:ai_weather/features/auth/presentation/widgets/custom_signup_title.dart';
import 'package:ai_weather/features/auth/presentation/widgets/signup_steps.dart';
import 'package:ai_weather/features/auth/presentation/widgets/smooth_page_indecator.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreenBody extends StatelessWidget {
  const SignUpScreenBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => locator<SignUpCubit>(),
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) {
            if (state is SignUpSuccess) {
              context.pushReplacementScreen(RouteNames.loginScreen);
              showCustomDialog(
                title: AppStrings.success,
                description: AppStrings.createAccountSuccess,
                dialogType: DialogType.success,
              );
            }
            if (state is SignUpFailed) {
              showCustomDialog(
                title: AppStrings.failure,
                description: state.errorMessage,
                dialogType: DialogType.error,
              );
            }
          },
          builder: (context, state) {
            if (state is SignUpLoading) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              );
            }
            var cubit = context.signUpCubit;
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.padding16(context),
                  vertical: AppSize.padding8(context)),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomSignUpTitle(),
                    SignUpSteps(
                      controller: cubit.controller,
                      onPageChanged: (p0) => cubit.changeIndex(p0),
                      signupSteps: cubit.signupSteps,
                    ),
                    SmoothPageIndecator(
                      controller: cubit.controller,
                    ),
                    CustomElevatedButton(
                      name: AppStrings.next.toUpperCase(),
                      onPressed: () {
                        cubit.changePage();
                      },
                      backgroundColor: AppColors.secondryColor,
                      width: context.screenWidth / 1.2,
                      height: context.screenHeight * 0.07,
                      textStyle: AppTextStyles.title28WhiteW500,
                    ),
                    CustomTextButton(
                      title: AppStrings.haveAnAccount.toUpperCase(),
                      onPressed: () {
                        context.popScreen();
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
