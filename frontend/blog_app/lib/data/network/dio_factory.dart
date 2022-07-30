import 'dart:convert';

import 'package:blog_app/config/utils/constants.dart';
import 'package:blog_app/config/utils/secure_storage.dart';
import 'package:blog_app/data/responses/authentication_response.dart';
import 'package:dio/dio.dart';

import '../../di.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "content-type";
const String ACCEPT = "accept";
const String AUTHORIZATION = "authorization";
const String DEFAULT_LANGUAGE = "language";

class DioFactory {
  // AppPreferences _appPreferences;
  //
  // DioFactory(this._appPreferences);

  Future<Dio> getDio() async {
    Dio dio = Dio();
    int _timeOut = 60 * 1000; // 1 min
    // String language = await _appPreferences.getAppLanguage();
    // String token = await _appPreferences.getUserToken();
    Map<String, String> headers = {
      CONTENT_TYPE: APPLICATION_JSON,
      ACCEPT: APPLICATION_JSON,
      // AUTHORIZATION: token,
      // DEFAULT_LANGUAGE: language
    };

    dio.options = BaseOptions(
        baseUrl: Globals.kBaseUrl,
        connectTimeout: _timeOut,
        receiveTimeout: _timeOut,
        headers: headers);

    dio.interceptors.add(
        InterceptorsWrapper(
          onRequest: (requestOptions, handler) {
            print("Request going is ${requestOptions.baseUrl}----${requestOptions.uri}--${requestOptions.path}");
            print("Request params going are ${requestOptions.data.toString()}");
            if(!requestOptions.uri.path.contains("login")){
              requestOptions.headers['accept']= 'application/json';
              requestOptions.headers['Authorization']="Bearer ${instance<SecureStorage>().token}";
              requestOptions.headers['Content-Type']="application/json";
            }
            print(requestOptions.data);
            print(requestOptions.headers);
            return handler.next(requestOptions);
          },
          onResponse: (response, handler) {
            // logger
            //     .i("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
            print("Response coming is ${response.data.toString()}");
            return handler.next(response);
          },
          onError: (e, handler) async {
            // if (e.response != null) {
            //   if (e.response?.statusCode == 401) {//catch the 401 here
            //     dio.interceptors.requestLock.lock();
            //     dio.interceptors.responseLock.lock();
            //     RequestOptions requestOptions = e.requestOptions;
            //
            //     await refreshToken();
            //     var accessToken = SecureStorage().token;
            //     final opts = new Options(method: requestOptions.method);
            //     dio.options.headers["Authorization"] = "Bearer " + accessToken;
            //     dio.options.headers["Accept"] = "*/*";
            //     dio.interceptors.requestLock.unlock();
            //     dio.interceptors.responseLock.unlock();
            //     final response = await dio.request(requestOptions.path,
            //         options: opts,
            //         cancelToken: requestOptions.cancelToken,
            //         onReceiveProgress: requestOptions.onReceiveProgress,
            //         data: requestOptions.data,
            //         queryParameters: requestOptions.queryParameters);
            //     if (response != null) {
            //       handler.resolve(response);
            //     } else {
            //       return null;
            //     }
            //   } else {
            //     handler.next(e);
            //   }
            // }
          },
        ),
      );

    // if (kReleaseMode) {
    //   print("release mode no logs");
    // } else {
    //   dio.interceptors.add(PrettyDioLogger(
    //       requestHeader: true, requestBody: true, responseHeader: true));
    // }

    return dio;
  }



  // static refreshToken() async {
  //   Response response;
  //   // Repository repository = Repository();
  //   var dio = Dio();
  //   // final Uri apiUrl = Uri.parse(BASE_PATH + "auth/reIssueAccessToken");
  //   // var refreshToken = await repository.readData("refreshToken");
  //   var refreshToken = SecureStorage().token;
  //   dio.options.headers["Authorization"] = "Bearer " + refreshToken;
  //   try {
  //     response = await dio.postUri(apiUrl);
  //     if (response.statusCode == 200) {
  //       AuthenticationResponse refreshTokenResponse =
  //       AuthenticationResponse.fromJson(jsonDecode(response.toString()));
  //
  //     } else {
  //       print(response.toString()); //TODO: logout
  //     }
  //   } catch (e) {
  //     print(e.toString()); //TODO: logout
  //   }
  // }



}
