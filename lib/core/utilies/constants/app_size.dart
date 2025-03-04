import 'package:flutter/material.dart';
import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';

class AppSize {
  // App height (كنسبة من ارتفاع الشاشة)
  static double h0(BuildContext context) => context.screenHeight * 0;
  static double h5(BuildContext context) => context.screenHeight * 0.005;
  static double h10(BuildContext context) => context.screenHeight * 0.01;
  static double h16(BuildContext context) => context.screenHeight * 0.016;
  static double h32(BuildContext context) => context.screenHeight * 0.032;

  // App width (كنسبة من عرض الشاشة)
  static double w0(BuildContext context) => context.screenWidth * 0;
  static double w10(BuildContext context) => context.screenWidth * 0.01;

  // App padding (كنسبة من عرض الشاشة)
  static double padding8(BuildContext context) => context.screenWidth * 0.02;
  static double padding16(BuildContext context) => context.screenWidth * 0.04;
  static double padding32(BuildContext context) => context.screenWidth * 0.08;

  // App radius (كنسبة من عرض الشاشة)
  static double r100(BuildContext context) => context.screenWidth * 0.25;
  static double r16(BuildContext context) => context.screenWidth * 0.04;
  static double r32(BuildContext context) => context.screenWidth * 0.08;
}
