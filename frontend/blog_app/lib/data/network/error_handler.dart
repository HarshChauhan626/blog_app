import 'package:blog_app/presentation/resources/app_strings.dart';
import 'package:dio/dio.dart';

import 'failure.dart';
import 'failure.dart';
import 'failure.dart';

enum DataSource {
  SUCCESS,
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT,
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ErrorHandler implements Exception {
  late ApiFailure apiFailure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error so its error from response of the API
      apiFailure = _handleError(error);
    } else {
      // default error
      apiFailure = DataSource.DEFAULT.getFailure();
    }
  }

  ApiFailure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectTimeout:
        return DataSource.CONNECT_TIMEOUT.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.SEND_TIMEOUT.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.RECEIVE_TIMEOUT.getFailure();
      case DioErrorType.response:
        switch (error.response?.statusCode) {
          case ResponseCode.BAD_REQUEST:
            return DataSource.BAD_REQUEST.getFailure();
          case ResponseCode.FORBIDDEN:
            return DataSource.FORBIDDEN.getFailure();
          case ResponseCode.UNAUTHORISED:
            return DataSource.UNAUTHORISED.getFailure();
          case ResponseCode.NOT_FOUND:
            return DataSource.NOT_FOUND.getFailure();
          case ResponseCode.INTERNAL_SERVER_ERROR:
            return DataSource.INTERNAL_SERVER_ERROR.getFailure();
          default:
            return DataSource.DEFAULT.getFailure();
        }
      case DioErrorType.cancel:
        return DataSource.CANCEL.getFailure();
      case DioErrorType.other:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  ApiFailure getFailure() {
    switch (this) {
      case DataSource.BAD_REQUEST:
        return ApiFailure(ResponseCode.BAD_REQUEST, ResponseMessage.BAD_REQUEST );
      case DataSource.FORBIDDEN:
        return ApiFailure(ResponseCode.FORBIDDEN, ResponseMessage.FORBIDDEN );
      case DataSource.UNAUTHORISED:
        return ApiFailure(ResponseCode.UNAUTHORISED, ResponseMessage.UNAUTHORISED );
      case DataSource.NOT_FOUND:
        return ApiFailure(ResponseCode.NOT_FOUND, ResponseMessage.NOT_FOUND );
      case DataSource.INTERNAL_SERVER_ERROR:
        return ApiFailure(ResponseCode.INTERNAL_SERVER_ERROR,
            ResponseMessage.INTERNAL_SERVER_ERROR );
      case DataSource.CONNECT_TIMEOUT:
        return ApiFailure(
            ResponseCode.CONNECT_TIMEOUT, ResponseMessage.CONNECT_TIMEOUT );
      case DataSource.CANCEL:
        return ApiFailure(ResponseCode.CANCEL, ResponseMessage.CANCEL );
      case DataSource.RECEIVE_TIMEOUT:
        return ApiFailure(
            ResponseCode.RECEIVE_TIMEOUT, ResponseMessage.RECEIVE_TIMEOUT );
      case DataSource.SEND_TIMEOUT:
        return ApiFailure(ResponseCode.SEND_TIMEOUT, ResponseMessage.SEND_TIMEOUT );
      case DataSource.CACHE_ERROR:
        return ApiFailure(ResponseCode.CACHE_ERROR, ResponseMessage.CACHE_ERROR );
      case DataSource.NO_INTERNET_CONNECTION:
        return ApiFailure(ResponseCode.NO_INTERNET_CONNECTION,
            ResponseMessage.NO_INTERNET_CONNECTION );
      case DataSource.DEFAULT:
        return ApiFailure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
      default:
        return ApiFailure(ResponseCode.DEFAULT, ResponseMessage.DEFAULT);
    }
  }
}

class ResponseCode {
  // API status codes
  static const int SUCCESS = 200; // success with data
  static const int NO_CONTENT = 201; // success with no content
  static const int BAD_REQUEST = 400; // ApiFailure, api rejected the request
  static const int FORBIDDEN = 403; // ApiFailure, api rejected the request
  static const int UNAUTHORISED = 401; // ApiFailure user is not authorised
  static const int NOT_FOUND =
      404; // ApiFailure, api url is not correct and not found
  static const int INTERNAL_SERVER_ERROR =
      500; // ApiFailure, crash happened in server side

  // local status code
  static const int DEFAULT = -1;
  static const int CONNECT_TIMEOUT = -2;
  static const int CANCEL = -3;
  static const int RECEIVE_TIMEOUT = -4;
  static const int SEND_TIMEOUT = -5;
  static const int CACHE_ERROR = -6;
  static const int NO_INTERNET_CONNECTION = -7;
}

class ResponseMessage {
  // API status codes
  // API response codes
  static const String SUCCESS = AppStrings.success; // success with data
  static const String NO_CONTENT =
      AppStrings.noContent; // success with no content
  static const String BAD_REQUEST =
      AppStrings.badRequestError; // ApiFailure, api rejected our request
  static const String FORBIDDEN =
      AppStrings.forbiddenError; // ApiFailure,  api rejected our request
  static const String UNAUTHORISED =
      AppStrings.unauthorizedError; // ApiFailure, user is not authorised
  static const String NOT_FOUND = AppStrings
      .notFoundError; // ApiFailure, API url is not correct and not found in api side.
  static const String INTERNAL_SERVER_ERROR =
      AppStrings.internalServerError; // ApiFailure, a crash happened in API side.

  // local responses codes
  static const String DEFAULT =
      AppStrings.defaultError; // unknown error happened
  static const String CONNECT_TIMEOUT =
      AppStrings.timeoutError; // issue in connectivity
  static const String CANCEL =
      AppStrings.defaultError; // API request was cancelled
  static const String RECEIVE_TIMEOUT =
      AppStrings.timeoutError; //  issue in connectivity
  static const String SEND_TIMEOUT =
      AppStrings.timeoutError; //  issue in connectivity
  static const String CACHE_ERROR = AppStrings
      .defaultError; //  issue in getting data from local data source (cache)
  static const String NO_INTERNET_CONNECTION =
      AppStrings.noInternetError; // issue in connectivity
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int ApiFailure = 1;
}
