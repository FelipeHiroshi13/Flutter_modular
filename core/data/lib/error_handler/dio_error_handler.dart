import 'package:data/error_handler/data_source.dart';
import 'package:dio/dio.dart';
import 'package:domain/model/failure.dart';

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      failure = handleError(error);
    } else {
      failure = DataSource.defaultError.failure;
    }
  }
}

Failure handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.connectionTimeout.failure;
    case DioExceptionType.sendTimeout:
      return DataSource.sendTimeout.failure;
    case DioExceptionType.receiveTimeout:
      return DataSource.receiveTimeout.failure;
    case DioExceptionType.badCertificate:
      return DataSource.defaultError.failure;
    case DioExceptionType.badResponse:
      return DataSource.defaultError.failure;
    case DioExceptionType.cancel:
      return DataSource.cancelled.failure;
    case DioExceptionType.connectionError:
      return DataSource.connectionTimeout.failure;
    default:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        return Failure(
            code: error.response!.statusCode!,
            message: error.response!.statusMessage!);
      } else {
        return DataSource.defaultError.failure;
      }
  }
}
