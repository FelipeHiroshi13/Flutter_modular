import 'package:data/error_handler/response_code.dart';
import 'package:data/error_handler/response_message.dart';
import 'package:domain/model/failure.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  internalServerError,
  connectionTimeout,
  cancelled,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  defaultError,
}

extension DataSourceExtension on DataSource {
  Failure get failure {
    switch (this) {
      case DataSource.success:
        return Failure(
            code: ResponseCode.success, message: ResponseMessage.success);
      case DataSource.noContent:
        return Failure(
            code: ResponseCode.noContent, message: ResponseMessage.noContent);
      case DataSource.badRequest:
        return Failure(
            code: ResponseCode.badRequest, message: ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(
            code: ResponseCode.forbidden, message: ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return Failure(
            code: ResponseCode.unauthorized,
            message: ResponseMessage.unauthorized);
      case DataSource.internalServerError:
        return Failure(
            code: ResponseCode.internalServerError,
            message: ResponseMessage.internalServerError);
      case DataSource.connectionTimeout:
        return Failure(
            code: ResponseCode.connectionTimeout,
            message: ResponseMessage.connectionTimeout);
      case DataSource.cancelled:
        return Failure(
            code: ResponseCode.cancelled, message: ResponseMessage.cancelled);
      case DataSource.receiveTimeout:
        return Failure(
            code: ResponseCode.receiveTimeout,
            message: ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return Failure(
            code: ResponseCode.sendTimeout,
            message: ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(
            code: ResponseCode.cacheError, message: ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(
            code: ResponseCode.noInternetConnection,
            message: ResponseMessage.noInternetConnection);
      case DataSource.defaultError:
        return Failure(
            code: ResponseCode.defaultError,
            message: ResponseMessage.defaultError);
    }
  }
}
