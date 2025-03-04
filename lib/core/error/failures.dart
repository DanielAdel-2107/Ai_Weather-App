abstract class Failure {
  final String errorMessage;
  Failure({required this.errorMessage});

  @override
  String toString() => errorMessage;
}

class ServerFailure extends Failure {
  ServerFailure({required super.errorMessage});
}

class OffLineFailure extends Failure {
  OffLineFailure({required super.errorMessage});
}

class WrongDataFailure extends Failure {
  WrongDataFailure({required super.errorMessage});
}
