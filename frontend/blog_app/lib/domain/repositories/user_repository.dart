import 'package:blog_app/data/responses/responses.dart';

abstract class UserRepository {
  Future<String> authenticateUser();
  Future<UserResponse> getUser();
  Future<String> signUpUser();
  Future<void> forgotPassword();
}
