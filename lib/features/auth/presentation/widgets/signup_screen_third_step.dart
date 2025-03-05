import 'package:ai_weather/core/components/custom_text_form_field_with_title.dart';
import 'package:ai_weather/core/utilies/constants/app_size.dart';
import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:ai_weather/core/utilies/strings/app_Strings.dart';
import 'package:ai_weather/features/auth/presentation/controller/sign_up/sign_up_cubit.dart';
import 'package:ai_weather/features/auth/presentation/widgets/select_user_gender.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreenThirdStep extends StatelessWidget {
  const SignupScreenThirdStep({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.signUpCubit;
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppSize.h10(context),
          children: [
            CustomTextFormFieldWithTitle(
              title: AppStrings.country,
              controller: cubit.countryController,
            ),
            SelectUserGender(
              genderType: cubit.genderType,
              onTapMale: () {
                cubit.selectGender(1);
              },
              onTapFemale: () {
                cubit.selectGender(2);
              },
            )
          ],
        );
      },
    );
  }
}

