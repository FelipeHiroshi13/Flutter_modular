import 'package:dartz/dartz.dart';
import 'package:data/network/api_safe_call.dart';
import 'package:data/network/network_info.dart';
import 'package:domain/model/failure.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/data/response/login_response.dart';
import 'package:login/data/services/login_service.dart';

abstract class ILoginremoteDataSource {
  Future<Either<Failure, LoginResponse>> login(LoginRequest request);
}

class LoginRemoteDataSource implements ILoginremoteDataSource {
  LoginRemoteDataSource({
    required this.loginService,
    required this.networkInfo,
  });

  final ILoginService loginService;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequest request) async {
    return safeApiCall(networkInfo, () async {
      final response =
          await loginService.login(request.email, request.password);

      return response.data;
    });
  }
}
