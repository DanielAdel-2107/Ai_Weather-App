import 'package:ai_weather/core/network/api/end_points.dart';

class ErrorModel {
  final String title;
  final int code;
  ErrorModel({
    required this.title,
    required this.code,
  });

  factory ErrorModel.fromJson(dynamic json) {
    return ErrorModel(
      title: json[ApiKeys.message],
      code: json[ApiKeys.code],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
    };
  }
}
