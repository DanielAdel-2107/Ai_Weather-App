import 'package:ai_weather/core/helper/check_internet.dart';
import 'package:ai_weather/core/helper/location_permission.dart';
import 'package:ai_weather/core/network/api/api_consumer.dart';
import 'package:ai_weather/core/network/api/dio_consumer.dart';
import 'package:ai_weather/core/network/firebase/auth/auth_services.dart';
import 'package:ai_weather/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:ai_weather/features/auth/data/repositories/auth_repositories_implementation.dart';
import 'package:ai_weather/features/auth/domain/repositories/auth_repository.dart';
import 'package:ai_weather/features/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:ai_weather/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:ai_weather/features/auth/domain/use_cases/sign_up_use_case.dart';
import 'package:ai_weather/features/auth/presentation/controller/forget_password/forget_password_cubit.dart';
import 'package:ai_weather/features/auth/presentation/controller/sign_in/sign_in_cubit.dart';
import 'package:ai_weather/features/auth/presentation/controller/sign_up/sign_up_cubit.dart';
import 'package:ai_weather/features/forecast/data/data_source/forecast_remote_data_source.dart';
import 'package:ai_weather/features/forecast/data/repositories/forecast_repository_implementation.dart';
import 'package:ai_weather/features/forecast/domain/repositories/forecast_repository.dart';
import 'package:ai_weather/features/forecast/domain/use_cases/get_forecast_use_case.dart';
import 'package:ai_weather/features/forecast/presentation/controller/cubit/get_forecast_cubit.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final locator = GetIt.instance;
Future<void> init() async {
  //! features /auth
  // cubits
  locator.registerFactory<SignInCubit>(() => SignInCubit(signInUseCaes: locator() ));
  locator.registerFactory<SignUpCubit>(
      () => SignUpCubit(signupUseCaes: locator()));
  locator.registerFactory<ForgetPasswordCubit>(() => ForgetPasswordCubit());
  // usecases
  locator.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(repository: locator()),
  );
  locator.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(repository: locator()),
  );
  locator.registerLazySingleton<ForgetPasswordUseCase>(
    () => ForgetPasswordUseCase(authRepository: locator()),
  );
  // repositories
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoriesImplementation(
            authRemoteDataSource: locator(),
            checkInternet: locator(),
          ));
  // data sources
  locator.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceWithFirebase(auth: locator()));
  //! features / forecast
  // cubits
  locator.registerFactory<GetForecastCubit>(() => GetForecastCubit(locator()));
  // usecases
  locator.registerLazySingleton<GetForecastUseCase>(
    () => GetForecastUseCase(forecastRepository: locator()),
  );
  // repositories
  locator.registerLazySingleton<ForecastRepository>(
      () => ForecastRepositoryImplementation(
            forecastRemoteDataSource: locator(),
            checkInternet: locator(),
          ));
  // data sources
  locator.registerLazySingleton<ForecastRemoteDataSource>(() =>
      ForecastRemoteDataSourceImplementationWithDio(apiConsumer: locator()));

  // core
  locator.registerLazySingleton<CheckInternet>(
      () => CheckInternetConnection(internetConnectionCkecker: locator()));
  locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: locator()));
  locator.registerLazySingleton<LocationPermissionServices>(
      () => LocationPermissionServices());
  locator.registerLazySingleton<FirebaseAuth>(
      () => FirebaseAuth.instance);

  // external dependencies
  locator
      .registerLazySingleton(() => InternetConnectionChecker.createInstance());
  locator.registerLazySingleton(() => Dio());
}
