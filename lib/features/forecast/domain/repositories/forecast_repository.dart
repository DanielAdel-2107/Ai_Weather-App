import 'package:ai_weather/core/error/failures.dart';
import 'package:ai_weather/features/forecast/domain/entities/forecast_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ForecastRepository {
  Future<Either<Failure, List<ForecastEntity>>> getForecast(
      {required double latitude, required double longitude});
  Future<Either<Failure, int>> aiPrediction(
      {required double maxTempC, required int willRain});
}
