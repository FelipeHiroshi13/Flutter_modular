import 'package:dio/dio.dart';
import 'package:login/data/response/login_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/dio.dart';

part 'login_service.g.dart';

const String baseUrl = 'https://minafarid.mocklab.io';

@RestApi(baseUrl: baseUrl)
abstract class ILoginService {
  factory ILoginService(Dio dio,
      {String baseUrl, ParseErrorLogger? errorLogger}) = _ILoginService;

  @POST("/customers/login")
  Future<HttpResponse<LoginResponse>> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}
