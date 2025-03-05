import 'package:ai_weather/core/error/exceptions.dart';
import 'package:ai_weather/core/network/firebase/auth/auth_services.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRemoteDataSource {
  Future<Unit> signIn({required String email, required String password});
  Future<Unit> signUp(
      {required String email,
      required String password,
      required String displayName});
  Future<Unit> forgetPassword({required String email});
}

class AuthRemoteDataSourceWithFirebase implements AuthRemoteDataSource {
  final AuthService auth;
  AuthRemoteDataSourceWithFirebase({required this.auth});
  @override
  Future<Unit> signIn({required String email, required String password}) async {
    try {
      await auth.signIn(email: email, password: password);
      return unit;
    } on FirebaseAuthWrongDataException catch (error) {
      throw WrongDataException(
        message: error.errorMessage,
      );
    } catch (error) {
      throw ServerException(
          errorMessage: "Unexpected error please try again later.");
    }
  }

  @override
  Future<Unit> signUp(
      {required String email,
      required String password,
      required String displayName}) async {
    try {
      await auth.signUp(
          email: email, password: password, displayName: displayName);
      return unit;
    } on FirebaseAuthWrongDataException catch (error) {
      throw WrongDataException(
        message: error.errorMessage,
      );
    } catch (error) {
      throw ServerException(
        errorMessage: error.toString(),
      );
    }
  }

  @override
  Future<Unit> forgetPassword({required String email}) async {
    try {
      await auth.forgetPassword(email: email);
      return unit;
    } on FirebaseAuthWrongDataException catch (error) {
      throw WrongDataException(
        message: error.errorMessage,
      );
    } catch (error) {
      throw ServerException(errorMessage: error.toString());
    }
  }
}
