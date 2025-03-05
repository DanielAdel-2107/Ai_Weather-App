import 'package:ai_weather/core/error/failures.dart';
import 'package:ai_weather/features/forecast/domain/entities/forecast_entity.dart';
import 'package:ai_weather/features/forecast/domain/repositories/forecast_repository.dart';
import 'package:dartz/dartz.dart';

class GetForecastUseCase {
  final ForecastRepository forecastRepository;
  GetForecastUseCase({required this.forecastRepository});
  Future<Either<Failure, List<ForecastEntity>>> call(
      {required double latitude, required double longitude}) async {
    return await forecastRepository.getForecast(
        latitude: latitude, longitude: longitude);
  }
}
