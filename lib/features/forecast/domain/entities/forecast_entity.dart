class ForecastEntity {
  final double minTempByCelsius;
  final double maxTempByCelsius;
  final double avgTempByCelsius;
  final String condition;
  final String icon;
  final String date;
  final int willRain;
  ForecastEntity(
      {required this.minTempByCelsius,
      required this.maxTempByCelsius,
      required this.avgTempByCelsius,
      required this.condition,
      required this.icon,
      required this.date,
      required this.willRain
      });
  
}
