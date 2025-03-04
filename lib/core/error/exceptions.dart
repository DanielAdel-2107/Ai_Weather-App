class ServerException implements Exception {
  final String? errorMessage;

  ServerException({this.errorMessage});
}

class OffLineException implements Exception {}

class WrongDataException implements Exception {
  final String message;

  WrongDataException({required this.message});
}
