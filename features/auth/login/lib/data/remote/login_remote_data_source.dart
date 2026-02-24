import 'package:login/data/request/login_request.dart';
import 'package:login/data/response/login_response.dart';
import 'package:login/data/services/login_service.dart';
import 'package:retrofit/retrofit.dart';

abstract class ILoginremoteDataSource {
  Future<HttpResponse<LoginResponse>> login(LoginRequest request);
}

class LoginRemoteDataSource implements ILoginremoteDataSource {
  LoginRemoteDataSource({required this.loginService});

  final ILoginService loginService;

  @override
  Future<HttpResponse<LoginResponse>> login(LoginRequest request) async {
    return await loginService.login(request.email, request.password);
  }
}
