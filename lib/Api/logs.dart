import 'package:dio/dio.dart';
import 'package:tecnical_test/Helpers/alerts.dart';

class Logs extends Interceptor {
  //When ever a request is made
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    ///
    printInfo('REQUEST[${options.method}] => PATH: ${options.path}');
    return super.onRequest(options, handler);
  }

  //When ever a response is received
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    printSuccess(
'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
    );
    return super.onResponse(response, handler);
  }

  //When ever an error occurs
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    printError(
  'ERROR : [${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    return super.onError(err, handler);
  }
}