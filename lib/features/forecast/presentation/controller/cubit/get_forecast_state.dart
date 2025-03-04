part of 'get_forecast_cubit.dart';

sealed class GetForecastState extends Equatable {
  const GetForecastState();

  @override
  List<Object> get props => [];
}

final class GetForecastInitial extends GetForecastState {}

final class GetForecastSuccess extends GetForecastState {
  final ForecastEntity forecast;

  const GetForecastSuccess({required this.forecast});
}

final class GetForecastLoading extends GetForecastState {}

final class GetForecastFailure extends GetForecastState {
  final String errorMessage;

  const GetForecastFailure({required this.errorMessage});
}
final class PermissionRequiredState extends GetForecastState {}
// ai state
final class GetAIPredictionLoading extends GetForecastState {}
final class GetAIPredictionSuccess extends GetForecastState {
  final String prediction;
  final DialogType dialogType;
  const GetAIPredictionSuccess({required this.prediction, required this.dialogType});
}
final class GetAIPredictionFailure extends GetForecastState {
  final String errorMessage;

  const GetAIPredictionFailure({required this.errorMessage});
}
