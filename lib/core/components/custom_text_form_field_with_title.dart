import 'package:ai_weather/core/utilies/colors/app_colors.dart';
import 'package:ai_weather/core/utilies/constants/app_size.dart';
import 'package:ai_weather/core/utilies/strings/app_strings.dart';
import 'package:ai_weather/core/utilies/styles/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldWithTitle extends StatefulWidget {
  const CustomTextFormFieldWithTitle({
    super.key,
    this.title,
    this.controller,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.isPassword = false,
  });
  final String? title;
  final String? hintText;
  final TextAlign textAlign;
  final TextEditingController? controller;
  final int? maxLength;
  final bool isPassword;
  @override
  @override
  State<CustomTextFormFieldWithTitle> createState() =>
      _CustomTextFormFieldWithTitleState();
}

class _CustomTextFormFieldWithTitleState
    extends State<CustomTextFormFieldWithTitle> {
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppSize.h5(context),
      children: [
        widget.title == null
            ? const SizedBox()
            : Padding(
                padding: EdgeInsets.only(left: AppSize.padding16(context)),
                child: Text(
                  widget.title!,
                  style: AppTextStyles.title20WhiteW500,
                ),
              ),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) =>
              value!.isEmpty ? AppStrings.fieldRequired : null,
          style: AppTextStyles.title18White,
          maxLength: widget.maxLength,
          controller: widget.controller,
          obscureText: widget.isPassword ? isPassword : false,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(
                horizontal: AppSize.padding16(context),
                vertical: AppSize.padding16(context)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(AppSize.r32(context)),
              ),
              borderSide: BorderSide.none,
            ),
            suffixIcon: widget.isPassword
                ? CustomIconButton(
                    icon: isPassword ? Icons.visibility_off : Icons.visibility,
                    onPressed: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  )
                : null,
            hintText: widget.hintText,
            hintStyle: AppTextStyles.title18White,
            fillColor: AppColors.greyColor,
            filled: true,
          ),
          textAlign: widget.textAlign,
        ),
      ],
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.icon,
    this.onPressed,
  });
  final IconData icon;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: Colors.white),
      onPressed: onPressed,
    );
  }
}
