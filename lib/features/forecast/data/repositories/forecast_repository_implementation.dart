import 'package:ai_weather/core/error/exceptions.dart';
import 'package:ai_weather/core/error/failures.dart';
import 'package:ai_weather/core/helper/check_internet.dart';
import 'package:ai_weather/core/utilies/strings/app_strings.dart';
import 'package:ai_weather/features/forecast/data/data_source/forecast_remote_data_source.dart';
import 'package:ai_weather/features/forecast/domain/entities/forecast_entity.dart';
import 'package:ai_weather/features/forecast/domain/repositories/forecast_repository.dart';
import 'package:dartz/dartz.dart';

class ForecastRepositoryImplementation implements ForecastRepository {
  final ForecastRemoteDataSource forecastRemoteDataSource;
  final CheckInternet checkInternet;
  ForecastRepositoryImplementation(
      {required this.forecastRemoteDataSource, required this.checkInternet});
  @override
  Future<Either<Failure, List<ForecastEntity>>> getForecast(
      {required double latitude, required double longitude}) async {
    if (await checkInternet.checkInternetConnection) {
      try {
        final forecast = await forecastRemoteDataSource.getForecastByCity(
            latitude: latitude, longitude: longitude);
        return Right(forecast);
      } on ServerException catch (e) {
        return Left(ServerFailure(errorMessage: e.errorMessage!.toString()));
      }
    } else {
      return Left(OffLineFailure(errorMessage: 'No Internet Connection'));
    }
  }

  @override
  Future<Either<Failure, int>> aiPrediction(
      {required double maxTempC, required int willRain}) async {
    if (await checkInternet.checkInternetConnection) {
      try {
        final response = await forecastRemoteDataSource.aiPrediction(
            maxTempC: maxTempC, willRain: willRain);
        return Right(response);
      } on Exception catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return Left(OffLineFailure(errorMessage: AppStrings.noInternet));
    }
  }
}
