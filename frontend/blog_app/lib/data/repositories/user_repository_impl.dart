import 'package:blog_app/data/network/api_result.dart';
import 'package:blog_app/data/datasources/local/local_storage_service.dart';
import 'package:blog_app/data/datasources/remote/remote_data_source.dart';
import 'package:blog_app/data/network/error_handler.dart';
import 'package:blog_app/data/network/failure.dart';
import 'package:blog_app/data/request/request.dart';
import 'package:blog_app/data/responses/user_response.dart';
import 'package:blog_app/domain/entities/authentication.dart';
import 'package:blog_app/domain/repositories/user_repository.dart';
import 'package:flutter/cupertino.dart';

class UserRepositoryImpl extends UserRepository {

  RemoteDataSource _remoteDataSource;
  LocalDataSource _localDataSource;

  UserRepositoryImpl(this._remoteDataSource,this._localDataSource);

  @override
  Future<ApiResult<Authentication>> authenticateUser(LoginRequest loginRequest) async{
    try{
      final response = await _remoteDataSource.login(loginRequest);
      return ApiResult.success(data: response.toDomain());
    }
    catch(e,s){
      debugPrint(e.toString());
      debugPrint(s.toString());
      return ApiResult.failure(error: ErrorHandler.handle(e.toString()).apiFailure);
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
