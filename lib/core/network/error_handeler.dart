// ignore_for_file: constant_identifier_names

import 'package:dio/dio.dart';

import '../constants/strings_constants.dart';
import '../errors/failures.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      // dio error so its an error from response of the API or from dio itself
      failure = _handleError(error);
    } else if (error is Failure) {
      // already a failure object
      failure = _serverError(error);
    } else {
      // default error
      failure = DataSource.DEFAULT.getFailure();
    }
  }
}

Failure _serverError(Failure failure) {
  switch (failure.statusCode) {
    case ResponseCode.BAD_REQUEST:
      return DataSource.BAD_REQUEST.getFailure();
    case ResponseCode.UNAUTORISED:
      return DataSource.UNAUTORISED.getFailure();
    case ResponseCode.FORBIDDEN:
      return DataSource.FORBIDDEN.getFailure();
    case ResponseCode.NOT_FOUND:
      return DataSource.NOT_FOUND.getFailure();
    case ResponseCode.INTERNAL_SERVER_ERROR:
      return DataSource.INTERNAL_SERVER_ERROR.getFailure();
    default:
      return DataSource.DEFAULT.getFailure();
  }
}

Failure _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECIEVE_TIMEOUT.getFailure();

    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return _serverError(Failure(error.response?.statusMessage ?? "",
            error.response?.statusCode ?? 0));
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.unknown:
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.CACHE_ERROR.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.NO_INTERNET_CONNECTION.getFailure();
  }
}

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECIEVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.SUCCESS:
        return Failure(ResponseMessage.SUCCESS, ResponseCode.SUCCESS);
      case DataSource.NO_CONTENT:
        return Failure(ResponseMessage.NO_CONTENT, ResponseCode.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return Failure(ResponseMessage.BAD_REQUEST, ResponseCode.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return Failure(ResponseMessage.FORBIDDEN, ResponseCode.FORBIDDEN);
      case DataSource.UNAUTORISED:
        return Failure(ResponseMessage.UNAUTORISED, ResponseCode.UNAUTORISED);
      case DataSource.NOT_FOUND:
        return Failure(ResponseMessage.NOT_FOUND, ResponseCode.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return Failure(ResponseMessage.INTERNAL_SERVER_ERROR,
            ResponseCode.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return Failure(
            ResponseMessage.CONNECT_TIMEOUT, ResponseCode.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return Failure(ResponseMessage.CANCEL, ResponseCode.CANCEL);
      case DataSource.RECIEVE_TIMEOUT:
        return Failure(
            ResponseMessage.RECIEVE_TIMEOUT, ResponseCode.RECIEVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return Failure(ResponseMessage.SEND_TIMEOUT, ResponseCode.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return Failure(ResponseMessage.CACHE_ERROR, ResponseCode.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return Failure(ResponseMessage.NO_INTERNET_CONNECTION,
            ResponseCode.NO_INTERNET_CONNECTION);
      default:
        return Failure(ResponseMessage.DEFAULT, ResponseCode.DEFAULT);
    }
  }
}

class ResponseCode {
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 204; // success with no data (no content)
  static const int BAD_REQUEST = 400; // failure, API rejected request
  static const int UNAUTORISED = 401; // failure, user is not authorised
  static const int FORBIDDEN = 403; //  failure, API rejected request
  static const int INTERNAL_SERVER_ERROR = 500; // failure, crash in server side
  static const int NOT_FOUND = 404; // failure, not found

  // local status code
  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECIEVE_TIMEOUT = -3;
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const SUCCESS = AppStrings.success; // success with data
  static const NO_CONTENT =
      AppStrings.success; // success with no data (no content)
  static const BAD_REQUEST =
      AppStrings.badRequestError; // failure, API rejected request
  static const UNAUTORISED =
      AppStrings.unauthorizedError; // failure, user is not authorised
  static const FORBIDDEN =
      AppStrings.forbiddenError; //  failure, API rejected request
  static const INTERNAL_SERVER_ERROR =
      AppStrings.internalServerError; // failure, crash in server side
  static const NOT_FOUND =
      AppStrings.notFoundError; // failure, crash in server side

  // local status code
  static const CONNECT_TIMEOUT = AppStrings.timeoutError;
  static const CANCEL = AppStrings.defaultError;
  static const RECIEVE_TIMEOUT = AppStrings.timeoutError;
  static const SEND_TIMEOUT = AppStrings.timeoutError;
  static const CACHE_ERROR = AppStrings.cacheError;
  static const NO_INTERNET_CONNECTION = AppStrings.noInternetError;
  static const DEFAULT = AppStrings.defaultError;
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
