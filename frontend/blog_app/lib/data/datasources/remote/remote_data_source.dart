import 'package:blog_app/config/utils/exceptions.dart';
import 'package:blog_app/config/utils/extensions.dart';
import 'package:blog_app/data/network/api_result.dart';
import 'package:blog_app/data/network/app_api.dart';
import 'package:blog_app/data/network/failure.dart';
import 'package:blog_app/data/request/request.dart';
import 'package:blog_app/data/responses/authentication_response.dart';
import 'package:blog_app/data/responses/blog_response.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  // Future<>
  Future<BlogListResponse> getBlogResponse(BlogListRequest blogListRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    try{
      final response= await _appServiceClient.login(
          loginRequest.email, loginRequest.password);

      if(response.statusCode==200 && response.data!=null){
        return AuthenticationResponse.fromJson(response.data);
      }
      else{
        throw ServerException(code: response.statusCode.orZero(),message: response.statusMessage.orEmpty());
      }
    }
    catch(e){
      rethrow;
    }
  }

  Future<BlogListResponse> getBlogResponse(BlogListRequest blogListRequest)async{
    try{
      final response= await _appServiceClient.getBlogs(blogListRequest);

      if(response.statusCode==200 && response.data!=null){
        return BlogListResponse.fromJson(response.data);
      }
      else{
        throw ServerException(code: response.statusCode.orZero(),message: response.statusMessage.orEmpty());
      }
    }
    catch(e){
      rethrow;
    }
  }






}
