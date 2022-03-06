
import 'package:blog_app/data/responses/responses.dart';

abstract class BaseApiService {
  Future<UserResponse> auth();
  Future<BlogResponse> blog();
}
