import 'package:ai_weather/core/di/dependancy_injection.dart';
import 'package:ai_weather/core/error/get_error_message_from_exception.dart';
import 'package:ai_weather/core/helper/location_permission.dart';
import 'package:ai_weather/core/network/firebase/auth/auth_services.dart';
import 'package:ai_weather/core/utilies/strings/app_strings.dart';
import 'package:ai_weather/features/forecast/domain/entities/forecast_entity.dart';
import 'package:ai_weather/features/forecast/domain/repositories/forecast_repository.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
part 'get_forecast_state.dart';

class GetForecastCubit extends Cubit<GetForecastState> {
  GetForecastCubit(this.forecastRepository) : super(GetForecastInitial()) {
    requestPermission();
  }
  final ForecastRepository forecastRepository;
  List<ForecastEntity>? forecasts;
  GetForecastSuccess? previousState;
  late bool hasLocationPermission;
  late String userName;
  Future<void> requestPermission() async {
    hasLocationPermission =
        await locator<LocationPermissionServices>().requestLocationPermission();
    userName = await locator<AuthService>().getUserName();
    if (!hasLocationPermission) {
      emit(PermissionRequiredState());
    } else {
      getForecast();
    }
  }

  getForecast() async {
    if (hasLocationPermission) {
      try {
        emit(GetForecastLoading());
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        final result = await forecastRepository.getForecast(
            latitude: position.latitude, longitude: position.longitude);
        result.fold(
          (failure) => emit(GetForecastFailure(
              errorMessage: getErrorMessageFromException(failure))),
          (data) {
            forecasts = data;
            emit(GetForecastSuccess(forecast: data.first));
          },
        );
      } on Exception catch (e) {
        emit(GetForecastFailure(errorMessage: e.toString()));
      }
    } else {
      hasLocationPermission = await locator<LocationPermissionServices>()
          .requestLocationPermission();
      if (hasLocationPermission) {
        getForecast();
      }
    }
  }

  void selectDate({required DateTime date}) {
    emit(GetForecastLoading());
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);
    try {
      final forecast = forecasts!.firstWhere((e) => e.date == formattedDate);
      emit(GetForecastSuccess(forecast: forecast));
    } catch (e) {
      emit(GetForecastFailure(errorMessage: "No forecast found for this date"));
      emit(GetForecastSuccess(forecast: forecasts!.last));
    }
  }

  getAiPrediction({required double maxTempC, required int willRain}) async {
    if (state is GetForecastSuccess) {
      previousState = state as GetForecastSuccess;
      emit(GetAIPredictionLoading());
      final response = await forecastRepository.aiPrediction(
          maxTempC: maxTempC, willRain: willRain);
      response.fold(
        (failure) => emit(GetForecastFailure(
            errorMessage: getErrorMessageFromException(failure))),
        (data) {
          emit(
            GetAIPredictionSuccess(
              prediction:
                  data == 1 ? AppStrings.goToTrain : AppStrings.stayAtHome,
              dialogType: data == 1 ? DialogType.success : DialogType.warning,
            ),
          );
        },
      );
    }
  }
}
