import 'package:blog_app/config/api_result.dart';
import 'package:blog_app/data/datasources/local/local_storage_service.dart';
import 'package:blog_app/data/datasources/remote/remote_data_source.dart';
import 'package:blog_app/data/network/error_handler.dart';
import 'package:blog_app/data/network/failure.dart';
import 'package:blog_app/data/request/request.dart';
import 'package:blog_app/data/responses/user_response.dart';
import 'package:blog_app/domain/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';

class UserRepositoryImpl extends UserRepository {

  RemoteDataSource _remoteDataSource;
  LocalDataSource _localDataSource;

  UserRepositoryImpl(this._remoteDataSource,this._localDataSource);

  @override
  Future<ApiResult<String>> authenticateUser(LoginRequest loginRequest) async{
    // TODO: implement authenticateUser
    try{
      final response = await _remoteDataSource.login(loginRequest);
      if(response.statusCode==200){
        return ApiResult.success(data: response.bearerToken??"");
      }
      else{
        return ApiResult.failure(error: ApiFailure(
          response.statusCode,
          "Message"
        ));
      }
    }
    catch(e){
      return ApiResult.failure(error: ErrorHandler.handle(e.toString()).apiFailure);
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> forgotPassword() {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<UserResponse> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<String> signUpUser() {
    // TODO: implement signUpUser
    throw UnimplementedError();
  }
  
}
