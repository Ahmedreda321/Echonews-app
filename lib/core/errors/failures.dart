
import '../constants/strings_constants.dart';

class Failure {
 final String message;
 final int statusCode;


 Failure(this.message, this.statusCode);
  @override
  String toString() => 'Failure(message: $message, statusCode: $statusCode)';
}

class ServerFailure extends Failure {
  ServerFailure() : super('Server Failure', 500);
}

class NetworkFailure extends Failure {
  NetworkFailure() : super(AppStrings.noInternetError,0);
}
