import 'package:ai_weather/core/error/exceptions.dart';
import 'package:ai_weather/core/error/failures.dart';
import 'package:ai_weather/core/helper/check_internet.dart';
import 'package:ai_weather/core/utilies/strings/app_strings.dart';
import 'package:ai_weather/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ai_weather/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoriesImplementation implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final CheckInternet checkInternet;
  AuthRepositoriesImplementation({
    required this.authRemoteDataSource,
    required this.checkInternet,
  });
  @override
  Future<Either<Failure, Unit>> signIn(
      {required String email, required String password}) async {
    return await _authMethodBody(
      () => authRemoteDataSource.signIn(email: email, password: password),
    );
  }

  @override
  Future<Either<Failure, Unit>> signup(
      {required String email, required String password,required String displayName}) async {
    return await _authMethodBody(
      () => authRemoteDataSource.signUp(email: email, password: password, displayName: displayName),
    );
  }

  @override
  Future<Either<Failure, Unit>> forgetPassword({required String email}) async {
    if (await checkInternet.checkInternetConnection) {
      try {
        await authRemoteDataSource.forgetPassword(
          email: email,
        );
        return Right(unit);
      } on WrongDataException catch (e) {
        return Left(WrongDataFailure(errorMessage: e.message));
      } catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return Left(OffLineFailure(errorMessage: AppStrings.noInternet));
    }
  }

  Future<Either<Failure, Unit>> _authMethodBody(
      Future<Unit> Function() method) async {
    if (await checkInternet.checkInternetConnection) {
      try {
        await method();
        return Right(unit);
      } on WrongDataException catch (e) {
        return Left(WrongDataFailure(errorMessage: e.message.toString()));
      } on ServerException catch (e) {
        return Left(ServerFailure(errorMessage: e.toString()));
      }
    } else {
      return Left(OffLineFailure(errorMessage: AppStrings.noInternet));
    }
  }
}
