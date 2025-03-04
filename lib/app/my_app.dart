// ignore_for_file: deprecated_member_use
import 'package:ai_weather/core/app_route/app_routes.dart';
import 'package:ai_weather/core/app_route/route_names.dart';
import 'package:ai_weather/core/di/dependancy_injection.dart';
import 'package:ai_weather/core/network/firebase/auth/auth_services.dart';
import 'package:ai_weather/core/utilies/colors/app_colors.dart';
import 'package:ai_weather/features/auth/presentation/controller/sign_up/sign_up_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<SignUpCubit>(),
      child: MaterialApp(
          navigatorKey: navigatorKey,
          debugShowCheckedModeBanner: false,
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
          useInheritedMediaQuery: true,
          routes: AppRoutes.routes,
        initialRoute: locator<AuthService>().isLoggedIn
            ? RouteNames.forecastScreen
            : RouteNames.splashScreen,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.primaryColor,
          ),
        ),
    );
  }
}
