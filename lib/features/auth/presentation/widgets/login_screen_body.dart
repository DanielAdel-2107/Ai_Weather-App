import 'package:ai_weather/core/utilies/constants/app_size.dart';
import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:ai_weather/features/auth/presentation/widgets/custom_login_title.dart';
import 'package:ai_weather/features/auth/presentation/widgets/user_login_form.dart';
import 'package:flutter/material.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppSize.padding16(context), vertical: AppSize.padding8(context)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomLoginTitle(),
                SizedBox(
                  height: context.screenHeight * .15,
                ),
                UserLogInForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
