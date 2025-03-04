import 'package:ai_weather/core/network/api/end_points.dart';
import 'package:ai_weather/core/network/api/error_model.dart';
import 'package:dio/dio.dart';

class DioServerException implements Exception {
  final ErrorModel errorModel;

  DioServerException({required this.errorModel});
}

void handleDioExceptions(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw DioServerException(
          errorModel: ErrorModel.fromJson(e.response!.data[ApiKeys.error]));
    case DioExceptionType.sendTimeout:
      throw DioServerException(
          errorModel: ErrorModel.fromJson(e.response!.data[ApiKeys.error]));
    case DioExceptionType.receiveTimeout:
      throw DioServerException(
          errorModel: ErrorModel.fromJson(e.response!.data[ApiKeys.error]));
    case DioExceptionType.badCertificate:
      throw DioServerException(
          errorModel: ErrorModel.fromJson(e.response!.data[ApiKeys.error]));
    case DioExceptionType.cancel:
      throw DioServerException(
          errorModel: ErrorModel.fromJson(e.response!.data[ApiKeys.error]));
    case DioExceptionType.connectionError:
      throw DioServerException(
          errorModel: ErrorModel.fromJson(e.response!.data[ApiKeys.error]));
    case DioExceptionType.unknown:
      throw DioServerException(
        errorModel: ErrorModel.fromJson(e.response!.data[ApiKeys.error]),
      );
    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
          throw DioServerException(
              errorModel: ErrorModel.fromJson(e.response!.data[ApiKeys.error]));
        case 401:
        case 403:
          throw DioServerException(
              errorModel: ErrorModel.fromJson(e.response!.data[ApiKeys.error]));
        case 404:
          throw DioServerException(
              errorModel: ErrorModel.fromJson(e.response!.data[ApiKeys.error]));
        case 500:
          throw DioServerException(
              errorModel: ErrorModel.fromJson(e.response!.data[ApiKeys.error]));
        case 502:
        case 503:
        case 504:
          throw DioServerException(
              errorModel: ErrorModel.fromJson(e.response!.data[ApiKeys.error]));
        default:
          throw DioServerException(
              errorModel: ErrorModel.fromJson(e.response!.data[ApiKeys.error]));
      }
  }
}
