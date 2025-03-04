import 'package:ai_weather/core/error/failures.dart';
import 'package:ai_weather/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(
      {required String email, required String password}) async {
    return await repository.signIn(email: email, password: password);
  }
}
