import 'package:blog_app/data/network/api_result.dart';
import 'package:blog_app/data/request/request.dart';
import 'package:blog_app/data/responses/responses.dart';
import 'package:blog_app/domain/entities/blog.dart';

abstract class BlogRepository {
  Future<ApiResult<BlogListEntity>> getBlogList(BlogListRequest blogListRequest);

}
