import 'package:dio/dio.dart';
import 'package:tecnical_test/Api/logs.dart';

class Apis {

  //App production
  static bool appProduction = false;

  //staging server url
  static String stagingBaseUrl = "";

  //live server url
  static String liveBaseUrl = "https://api.lufthansa.com/v1";

  static String baseUrl = "";
  static String base = "";
  static String liveServer = "";

  static int connectTimeout = 80*1000;
  static int receiveTimeout = 80*1000;

  static String sentryDns = "";

  static Dio dio = Dio(
    BaseOptions(
      baseUrl: Apis.liveBaseUrl,
      connectTimeout: Apis.connectTimeout,
      receiveTimeout: Apis.receiveTimeout,
    ),
  )..interceptors.add(Logs());

}