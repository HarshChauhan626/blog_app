import 'package:blog_app/config/dio_client.dart';

import 'base_api_service.dart';
import 'package:dio/dio.dart';


class ApiService extends BaseApiService {
  DioClient? dioClient;

  ApiService(this.dioClient) {
    // dioClient = DioClient();
    // dioClient?.init();
  }

}
