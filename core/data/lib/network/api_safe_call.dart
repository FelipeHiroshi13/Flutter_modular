import 'package:dartz/dartz.dart';
import 'package:data/error_handler/data_source.dart';
import 'package:data/error_handler/dio_error_handler.dart';
import 'package:data/network/network_info.dart';
import 'package:domain/model/failure.dart';

Future<Either<Failure, T>> safeApiCall<T>(
  NetworkInfo networkInfo,
  Future<T> Function() apiCall,
) async {
  if (await networkInfo.isConnected) {
    try {
      final response = await apiCall();
      return Right(response);
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  } else {
    return Left(DataSource.noInternetConnection.failure);
  }
}
