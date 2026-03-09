import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';

abstract class UseCaseWithParams<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}
