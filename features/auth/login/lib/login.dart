library;

import 'package:dio/dio.dart';
import 'package:domain/model/failure.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
  Dio dio = Dio();
  Failure failure = Failure(code: 0, message: '');
}
