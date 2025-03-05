import 'package:ai_weather/core/error/failures.dart';
import 'package:ai_weather/features/forecast/domain/repositories/forecast_repository.dart';
import 'package:dartz/dartz.dart';

class AiPredictionUseCase {
  final ForecastRepository repository;

  AiPredictionUseCase({required this.repository});
  Future<Either<Failure, int>> call(
      {required double maxTempC, required int willRain}) async {
    return await repository.aiPrediction(
        maxTempC: maxTempC, willRain: willRain);
  }
}
