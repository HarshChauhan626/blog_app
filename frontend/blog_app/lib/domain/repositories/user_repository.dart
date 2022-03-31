import 'package:blog_app/config/api_result.dart';
import 'package:blog_app/data/request/request.dart';
import 'package:blog_app/data/responses/responses.dart';

abstract class UserRepository {
  Future<ApiResult<String>> authenticateUser(LoginRequest loginRequest);
  Future<UserResponse> getUser();
  Future<String> signUpUser();
  Future<void> forgotPassword();
}
