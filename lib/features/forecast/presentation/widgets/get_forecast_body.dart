import 'dart:developer';

import 'package:ai_weather/core/components/custom_elevated_button.dart';
import 'package:ai_weather/core/utilies/colors/app_colors.dart';
import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:ai_weather/core/utilies/strings/app_strings.dart';
import 'package:ai_weather/core/utilies/styles/app_text_styles.dart';
import 'package:ai_weather/features/forecast/domain/entities/forecast_entity.dart';
import 'package:ai_weather/features/forecast/presentation/controller/cubit/get_forecast_cubit.dart';
import 'package:ai_weather/features/forecast/presentation/widgets/temp_chart.dart';
import 'package:ai_weather/features/forecast/presentation/widgets/temp_percentage.dart';
import 'package:ai_weather/features/forecast/presentation/widgets/welcome_and_user_name.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetForcastBody extends StatelessWidget {
  const GetForcastBody({
    super.key,
    required this.forecast,
  });
  final ForecastEntity forecast;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.02,
        vertical: context.screenHeight * 0.005,
      ),
      child: SingleChildScrollView(
        child: Column(
          spacing: context.screenHeight * 0.03,
          children: [
            WelcomeAndUserName(),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              height: context.screenHeight * 0.15,
              width: context.screenWidth * 0.5,
              child: DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.secondryColor,
                selectedTextColor: Colors.white,
                daysCount: 3,
                onDateChange: (date) async {
                  context.getForecastCubit.selectDate(date: date);
                },
              ),
            ),
            Text(
              "${forecast.avgTempByCelsius} C",
              style: AppTextStyles.title36WhiteW500,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  forecast.condition,
                  style: AppTextStyles.title20WhiteW500,
                ),
                Image.network(
                  "https:${forecast.icon}",
                  width: context.screenWidth * 0.15,
                )
              ],
            ),
            TempPercentage(forecast: forecast),
            TempChart(),
            BlocBuilder<GetForecastCubit, GetForecastState>(
              builder: (context, state) {
                return state is GetAIPredictionLoading
                    ? Center(
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : CustomElevatedButton(
                        name: AppStrings.aiPrediction,
                        onPressed: () {
                          log(forecast.maxTempByCelsius.toString()+forecast.willRain.toString());
                          context.getForecastCubit.getAiPrediction(
                              maxTempC: forecast.maxTempByCelsius,
                              willRain: forecast.willRain);
                        },
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
