import 'package:ai_weather/core/components/custom_elevated_button.dart';
import 'package:ai_weather/core/di/dependancy_injection.dart';
import 'package:ai_weather/core/helper/show_custom_dialog.dart';
import 'package:ai_weather/core/utilies/colors/app_colors.dart';
import 'package:ai_weather/core/utilies/extensions/app_extensions.dart';
import 'package:ai_weather/core/utilies/strings/app_strings.dart';
import 'package:ai_weather/features/forecast/presentation/controller/cubit/get_forecast_cubit.dart';
import 'package:ai_weather/features/forecast/presentation/widgets/disable_permission_body.dart';
import 'package:ai_weather/features/forecast/presentation/widgets/get_forecast_body.dart';
import 'package:ai_weather/features/forecast/presentation/widgets/loading_forecast_body.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForecastScreenBody extends StatelessWidget {
  const ForecastScreenBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => locator<GetForecastCubit>(),
        child: BlocConsumer<GetForecastCubit, GetForecastState>(
          listener: (context, state) {
            if (state is GetForecastFailure) {
              showCustomDialog(
                title: AppStrings.error,
                description: state.errorMessage,
                dialogType: DialogType.error,
              );
            }
            if (state is GetAIPredictionFailure) {
              showCustomDialog(
                title: state.errorMessage,
                description: state.errorMessage,
                dialogType: DialogType.info,
              );
            }
            if (state is GetAIPredictionSuccess) {
              showCustomDialog(
                title: AppStrings.aiPrediction,
                description: state.prediction,
                dialogType: state.dialogType,
              );
            }
          },
          builder: (context, state) {
            if (state is GetForecastSuccess) {
              return GetForcastBody(
                forecast: state.forecast,
              );
            }
            if (state is GetForecastLoading) {
              return LoadingForecastBody();
            }
            if (state is GetAIPredictionLoading || state is GetAIPredictionSuccess || state is GetAIPredictionFailure) {
              return GetForcastBody(
                forecast: context.getForecastCubit.previousState!.forecast,
              );
            }
            if (state is PermissionRequiredState) {
              return DisablePermissionBody();
            }
            return Center(
              child: CustomElevatedButton(
                name: "Get Forcast",
                backgroundColor: AppColors.secondryColor,
                onPressed: () {
                  context.getForecastCubit.getForecast();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
