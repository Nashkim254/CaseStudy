import 'package:dio/dio.dart';
import 'package:tecnical_test/Api/apis.dart';
import 'package:tecnical_test/Helpers/alerts.dart';
import 'package:tecnical_test/Models/response_model.dart';

FormData convertFormData(body) {
  return FormData.fromMap(body);
}
//get airports -> request to lufthansa
Future<ResponseModel> getAirports(limit,String token) async {
  Map? data;
  int? code;
  try {
    Response response = await Apis.dio.post(
      '/mds-references/airports',
     options: Options(headers: {"authorization": "Bearer $token"}),
      queryParameters: {
        "limit": limit
      }
    );
    data = response.data;
    code = response.statusCode;
  } on DioError catch (e) {
    // Exceptions
    if (e.type == DioErrorType.response) {
      data = e.response!.data;
      code = e.response!.statusCode;
    }
    if (e.type == DioErrorType.connectTimeout) {
      showToast('check your connection!');
    }

    if (e.type == DioErrorType.receiveTimeout) {
      showToast('check your connection!');
    }

    if (e.type == DioErrorType.other) {
      showToast('An error occured!');
    }
  }
  return ResponseModel(data: data, code: code!);
}
