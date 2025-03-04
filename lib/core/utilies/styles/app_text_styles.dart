import 'package:ai_weather/core/helper/get_responsive_font_size.dart';
import 'package:ai_weather/core/utilies/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle title20WhiteW500 = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 20),
    fontWeight: FontWeight.w500,
  );

  static TextStyle title24WhiteW500 = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 24),
    fontWeight: FontWeight.w500,
  );
  static TextStyle title26SecondaryColorW700 = TextStyle(
    color: AppColors.secondryColor,
    fontSize: getResponsiveFontSize(fontSize: 26),
    fontWeight: FontWeight.w700,
  );
  static TextStyle title22GreyColor = TextStyle(
    color: Colors.grey.shade100,
    fontSize: getResponsiveFontSize(fontSize: 22),
  );

  static TextStyle title28WhiteW500 = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 28),
    fontWeight: FontWeight.w500,
  );
  static TextStyle title36WhiteW500 = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 36),
    fontWeight: FontWeight.w500,
  );

  static TextStyle title42WhiteW500 = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 42),
    fontWeight: FontWeight.w500,
  );
  static TextStyle title12White = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 12),
  );

  static TextStyle title16White300 = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontWeight: FontWeight.w300,
  );
  static TextStyle title18White = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 18),
  );

  static TextStyle title16White500 = TextStyle(
    color: Colors.white,
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontWeight: FontWeight.w500,
  );

  static TextStyle title28PrimaryColorW500 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: getResponsiveFontSize(fontSize: 28),
    fontWeight: FontWeight.w500,
  );

  static TextStyle title16PrimaryColorW500 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontWeight: FontWeight.w500,
  );

  static TextStyle title16SecondaryColorW500 = TextStyle(
    color: AppColors.secondryColor,
    fontSize: getResponsiveFontSize(fontSize: 16),
    fontWeight: FontWeight.w500,
  );

  static TextStyle title24PrimaryColorW500 = TextStyle(
    color: AppColors.primaryColor,
    fontSize: getResponsiveFontSize(fontSize: 24),
    fontWeight: FontWeight.w500,
  );
}
