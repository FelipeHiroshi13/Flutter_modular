import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';
import 'package:domain/usecase/base_usecase.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/domain/model/login_model.dart';
import 'package:login/domain/repos/i_login_repos.dart';

class LoginUsecase implements UseCaseWithParams<LoginModel, LoginRequest> {
  const LoginUsecase({required this.repository});

  final ILoginRepos repository;

  @override
  Future<Either<Failure, LoginModel>> call(LoginRequest params) async =>
      repository.login(params);
}
