import 'package:extensions/extensions.dart';
import 'package:login/data/response/login_response.dart';
import 'package:login/domain/model/login_model.dart';

extension LoginResponseMapper on LoginResponse {
  LoginModel toModel() {
    return LoginModel(
      name: name.orEmpty,
      phone: phone.orEmpty,
      age: int.parse(age ?? ''),
    );
  }
}
