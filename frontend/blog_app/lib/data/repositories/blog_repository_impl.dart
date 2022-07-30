import 'package:blog_app/config/utils/exceptions.dart';
import 'package:blog_app/config/utils/extensions.dart';
import 'package:blog_app/data/datasources/local/local_storage_service.dart';
import 'package:blog_app/data/datasources/remote/remote_data_source.dart';
import 'package:blog_app/data/network/api_result.dart';
import 'package:blog_app/data/network/error_handler.dart';
import 'package:blog_app/data/network/failure.dart';
import 'package:blog_app/data/request/request.dart';
import 'package:blog_app/data/responses/blog_response.dart';
import 'package:blog_app/domain/entities/blog.dart';
import 'package:blog_app/domain/repositories/blog_repository.dart';
import 'package:flutter/cupertino.dart';




class BlogRepositoryImpl extends BlogRepository{

  RemoteDataSource _remoteDataSource;
  LocalDataSource _localDataSource;

  BlogRepositoryImpl(this._remoteDataSource,this._localDataSource);



  @override
  Future<ApiResult<BlogListEntity>> getBlogList(BlogListRequest blogListRequest)async {
    // TODO: implement getBlog
    try{
      final response = await _remoteDataSource.getBlogResponse(blogListRequest);

      return ApiResult.success(data: response.toDomain());
    }
    on ServerException catch(e){
      return ApiResult.failure(error: ApiFailure(e.code!.orZero(),e.message!.orEmpty()));
    }
    catch(e,s){
      debugPrint(e.toString());
      debugPrint(s.toString());
      return ApiResult.failure(error: ErrorHandler.handle(e.toString()).apiFailure);
    }
  }
  
}