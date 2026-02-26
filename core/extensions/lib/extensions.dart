import 'package:extensions/constant/constant.dart';

extension NonNullString on String? {
  String get orEmpty => this ?? Constants.empty;
}

extension NonNullInteger on int? {
  int get orZero => this ?? Constants.zero;
}
