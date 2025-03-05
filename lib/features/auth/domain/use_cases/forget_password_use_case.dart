import 'package:ai_weather/core/error/failures.dart';
import 'package:ai_weather/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class ForgetPasswordUseCase {
  final AuthRepository authRepository;

  ForgetPasswordUseCase({required this.authRepository});

  Future<Either<Failure, Unit>> call({required String email}) async {
    return await authRepository.forgetPassword(email: email);
  }
}
