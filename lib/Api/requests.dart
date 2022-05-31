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
    Response response = await Apis.dio.get(
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


//get schedules -> request to lufthansa
Future<ResponseModel> getSchedules(String token) async {
  Map? data;
  int? code;
  try {
    Response response = await Apis.dio.get(
      '/flight-schedules/flightschedules/passenger',
     options: Options(headers: {"authorization": "Bearer $token"}),
      queryParameters: {
        "airlines": "LH",
        "flightNumberRanges": "400-405",
        "startDate": "05DEC19",
        "endDate": "10DEC19",
        "daysOfOperation":"1234567",
        "timeMode":"UTC"
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