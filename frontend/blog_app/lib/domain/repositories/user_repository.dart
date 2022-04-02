import 'package:blog_app/data/network/api_result.dart';
import 'package:blog_app/data/request/request.dart';
import 'package:blog_app/data/responses/responses.dart';
import 'package:blog_app/domain/entities/authentication.dart';

abstract class UserRepository {
  Future<ApiResult<Authentication>> authenticateUser(LoginRequest loginRequest);
  Future<UserResponse> getUser();
  Future<String> signUpUser();
  Future<void> forgotPassword();
}