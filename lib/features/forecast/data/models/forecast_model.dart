import 'package:ai_weather/core/network/api/end_points.dart';
import 'package:ai_weather/features/forecast/domain/entities/forecast_entity.dart';

class ForecastModel extends ForecastEntity {
  final String date;
  final DayWeather day;

  ForecastModel({required this.date, required this.day})
      : super(
          minTempByCelsius: day.minTempC,
          maxTempByCelsius: day.maxTempC,
          avgTempByCelsius: day.avgTempC,
          condition: day.condition.text,
          icon: day.condition.icon,
          willRain: day.willRain,
          date: date,
        );

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    return ForecastModel(
      date: json[ApiKeys.date],
      day: DayWeather.fromJson(json[ApiKeys.day]),
    );
  }
}

class DayWeather {
  final double maxTempC;
  final double minTempC;
  final double avgTempC;
  final double maxWindKph;
  final int avghumidity;
  final WeatherCondition condition;
  final int willRain;
  DayWeather({
    required this.maxTempC,
    required this.minTempC,
    required this.avgTempC,
    required this.maxWindKph,
    required this.avghumidity,
    required this.condition,
    required this.willRain,
  });

  factory DayWeather.fromJson(Map<String, dynamic> json) {
    return DayWeather(
      maxTempC: json[ApiKeys.maxtempC].toDouble(),
      minTempC: json[ApiKeys.mintempC].toDouble(),
      avgTempC: json[ApiKeys.avgTempC].toDouble(),
      maxWindKph: json[ApiKeys.maxWindKph].toDouble(),
      willRain: json[ApiKeys.willRain],
      avghumidity: json[ApiKeys.avghumidity],
      condition: WeatherCondition.fromJson(json[ApiKeys.condition]),
    );
  }
}

class WeatherCondition {
  final String text;
  final String icon;

  WeatherCondition({required this.text, required this.icon});

  factory WeatherCondition.fromJson(Map<String, dynamic> json) {
    return WeatherCondition(
      text: json[ApiKeys.text] ?? "Unknown",
      icon: json[ApiKeys.icon] ?? "",
    );
  }
}
