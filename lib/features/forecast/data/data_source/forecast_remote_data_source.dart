import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ai_weather/core/error/exceptions.dart';
import 'package:ai_weather/core/network/api/api_consumer.dart';
import 'package:ai_weather/core/network/api/end_points.dart';
import 'package:ai_weather/core/network/api/exceptions.dart';
import 'package:ai_weather/core/utilies/constants/app_constants.dart';
import 'package:ai_weather/features/forecast/data/models/forecast_model.dart';

abstract class ForecastRemoteDataSource {
  Future<List<ForecastModel>> getForecastByCity(
      {required double latitude, required double longitude});
  Future<int> aiPrediction({required double maxTempC, required int willRain});
}

class ForecastRemoteDataSourceImplementationWithDio
    implements ForecastRemoteDataSource {
  final ApiConsumer apiConsumer;
  ForecastRemoteDataSourceImplementationWithDio({required this.apiConsumer});
  @override
  Future<List<ForecastModel>> getForecastByCity(
      {required double latitude, required double longitude}) async {
    try {
      final responde = await apiConsumer.get(
          "${EndPoints.getForecast}?q=$latitude,$longitude&days=7&hour=24&key=${AppConstants.apiKey}");
      List<ForecastModel> forecastModelList =
          (responde["forecast"]["forecastday"] as List)
              .map((e) => ForecastModel.fromJson(e))
              .toList();
      return forecastModelList;
    } on DioServerException catch (e) {
      throw ServerException(errorMessage: e.errorModel.title);
    }
  }

  @override
  Future<int> aiPrediction(
      {required double maxTempC, required int willRain}) async {
    final url = Uri.parse('http://10.0.2.2:5001/predict');
    Map<String, dynamic> body = {
      'features': [
        willRain == 1 ? 1 : 0,
        willRain == 0 ? 1 : 0,
        maxTempC >= 30 ? 1 : 0,
        maxTempC > 20 && maxTempC < 29 ? 1 : 0,
        maxTempC > 15 && maxTempC < 20 ? 1 : 0,
      ]
    };
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(body),
    );
    if (response.statusCode == 200) {
      final prediction = json.decode(response.body)['prediction'];
      return prediction.first;
    } else {
      throw ServerException(errorMessage: 'Failed to get prediction');
    }
  }
}
