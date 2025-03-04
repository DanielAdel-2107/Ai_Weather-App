import 'package:ai_weather/features/forecast/presentation/widgets/forecast_screen_body.dart';
import 'package:flutter/material.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForecastScreenBody(),
    );
  }
}
