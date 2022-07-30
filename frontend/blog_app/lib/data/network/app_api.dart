import 'package:blog_app/config/utils/constants.dart';
import 'package:blog_app/data/request/request.dart';
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

  @POST("/blogs/{blog_id}/like")
  Future<Response> likePost(
      @Path("blog_id") int blogId
      );

  @DELETE("/blogs/{blog_id}/like")
  Future<Response> unlikePost(
      @Path("blog_id") int blogId
      );

  @GET("/blogs/{blog_id}/comments")
  Future<Response> getPostComments(
      @Path("blog_id") int blogId
      );

  @POST("/blogs/{blog_id}/comments")
  Future<Response> addPostComment(
      @Path("blog_id") int blogId
      );

  @DELETE("/blogs/{blog_id}/comments/{comment_id}")
  Future<Response> deletePostComments(
      @Path("blog_id") int blogId,
      @Path("comment_id") int commentId
      );

  @GET("/blogs/{blog_id}")
  Future<Response> fetchBlog(
      @Path("blog_id") int blogId
      );

  @DELETE("/blogs/{blog_id}")
  Future<Response> deleteBlog(
      @Path("blog_id") int blogI
      );

  @POST("/blogs/list")
  Future<Response> getBlogs(@Body() BlogListRequest blogListRequest);


}
