import 'package:domain/model/localised_message.dart';

class Failure {
  Failure({
    required this.code,
    required this.message,
  });

  int code;
  LocalisedMessage message;
}
