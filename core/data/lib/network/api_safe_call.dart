import 'package:dartz/dartz.dart';
import 'package:data/network/network_info.dart';
import 'package:domain/model/failure.dart';
import 'package:domain/model/localised_message.dart';

Future<Either<Failure, T>> safeApiCall<T>(
  NetworkInfo networkInfo,
  Future<T> Function() apiCall,
) async {
  if (await networkInfo.isConnected) {
    try {
      final response = await apiCall();
      return Right(response);
    } catch (e) {
      return Left(
        Failure(
            message: LocalisedMessage(english: 'english', arabic: 'arabic'),
            code: 0),
      );
    }
  } else {
    return Left(
      Failure(
          message: LocalisedMessage(
              english: 'No internet connection',
              arabic: 'لا يوجد اتصال بالإنترنت'),
          code: 0),
    );
  }
}
