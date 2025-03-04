import'package:internet_connection_checker/internet_connection_checker.dart';
abstract class CheckInternet {
  Future<bool> get checkInternetConnection;
}
class CheckInternetConnection implements CheckInternet{
  final InternetConnectionChecker internetConnectionCkecker;
  CheckInternetConnection({required this.internetConnectionCkecker});
  @override
  Future<bool> get checkInternetConnection => internetConnectionCkecker.hasConnection;
  }
