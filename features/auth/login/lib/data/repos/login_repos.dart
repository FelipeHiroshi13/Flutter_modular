import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';
import 'package:login/data/remote/login_remote_data_source.dart';
import 'package:login/data/request/login_request.dart';
import 'package:login/domain/model/login_model.dart';
import 'package:login/domain/repos/i_login_repos.dart';

class LoginRepos implements ILoginRepos {
  LoginRepos({required this.remoteDataSource});

  final ILoginremoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, LoginModel>> login(LoginRequest request) async {
    throw UnimplementedError();
    // try {
    //   final response = await remoteDataSource.login(request);
    //   return Right(response.toModel());
    // } catch (e) {
    //   return Left(Failure(message: , code: null));
    // }
  }
}
