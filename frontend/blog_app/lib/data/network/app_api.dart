import 'package:blog_app/config/utils/constants.dart';
import 'package:blog_app/data/responses/authentication_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Globals.kBaseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/auth/login")
  Future<Response> login(
    @Field("email") String email,
    @Field("password") String password,
  );
}
