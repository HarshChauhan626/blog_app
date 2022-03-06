import 'package:blog_app/data/responses/responses.dart';

abstract class BlogRepository {
  Future<BlogResponse> getBlog();
}
