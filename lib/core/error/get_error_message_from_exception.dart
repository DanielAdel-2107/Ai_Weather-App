  import 'package:ai_weather/core/error/failures.dart';

String getErrorMessageFromException(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return failure.errorMessage;
      case OffLineFailure:
        return failure.errorMessage;
      case WrongDataFailure:
        return failure.errorMessage;
      default:
        return "Unexpected error occurred. Please try again later.";
    }
  }
