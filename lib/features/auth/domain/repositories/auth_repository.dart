import 'package:ai_weather/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, Unit>> signIn(
      {required String email, required String password});
  Future<Either<Failure, Unit>> signup(
      {required String email, required String password,required String displayName});
  Future<Either<Failure, Unit>> forgetPassword({required String email});
}
