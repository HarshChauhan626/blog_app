import 'package:blog_app/config/utils/constants.dart';
import 'package:dio/dio.dart';

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
            // logger.i(
            //     "REQUEST[${requestOptions.method}] => PATH: ${requestOptions.path}"
            //     "=> REQUEST VALUES: ${requestOptions.queryParameters} => HEADERS: ${requestOptions.headers}");
            print("Request going is ${requestOptions.baseUrl}----${requestOptions.uri}--${requestOptions.path}");
            print("Request params going are ${requestOptions.data.toString()}");
            return handler.next(requestOptions);
          },
          onResponse: (response, handler) {
            // logger
            //     .i("RESPONSE[${response.statusCode}] => DATA: ${response.data}");
            print("Response coming is ${response.data.toString()}");
            return handler.next(response);
          },
          onError: (err, handler) {
            // logger.i("Error[${err.response?.statusCode}]");
            print("Error coming is ${err.message.toString()}");
            return handler.next(err);
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
}
