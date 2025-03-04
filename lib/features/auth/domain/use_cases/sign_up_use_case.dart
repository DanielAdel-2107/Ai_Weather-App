import 'package:ai_weather/core/error/failures.dart';
import 'package:ai_weather/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignUpUseCase {
  final AuthRepository repository;

  SignUpUseCase({required this.repository});
  Future<Either<Failure, Unit>> call(
      {required String email,
      required String password,
      required String displayName}) async {
    return await repository.signup(
        email: email, password: password, displayName: displayName);
  }
}
