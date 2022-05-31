import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tecnical_test/Api/requests.dart';
import 'package:tecnical_test/Helpers/alerts.dart';
import 'package:tecnical_test/Models/response_model.dart';

class MapPageController extends GetxController {
  //an observable boolean isLoading
  var isLoading = true.obs;
  //token to authorize api requests to lufthansa
  String token = "b8wjxp2cwx85pgjrdnr3hyk7";
  var originLat = 0.0.obs;
  var originLng = 0.0.obs;
  var destLng = 0.0.obs;
  var destLat = 0.0.obs;
  var startLocation;
  var endLocation;
  // LatLng startLocation = const LatLng(27668.3619, 85.3101895);
  //Method to fetch all airlines info
 Future  getAirlines(int limit, String token) async {
    isLoading(true);
    ResponseModel response = await getAirports(limit, token);

    if (response.code == 200) {
      showToastSuccess("Data fetched successfully");
      // printSuccess( response.data["AirportResource"]["Airports"]["Airport"][1]
      //     ["Position"]["Coordinate"]["Longitude"]);
      originLat.value = response.data["AirportResource"]["Airports"]["Airport"]
          [2]["Position"]["Coordinate"]["Latitude"];
      originLng.value = response.data["AirportResource"]["Airports"]["Airport"]
          [2]["Position"]["Coordinate"]["Longitude"];
      destLat.value = response.data["AirportResource"]["Airports"]["Airport"][3]
          ["Position"]["Coordinate"]["Latitude"];
      destLng.value = response.data["AirportResource"]["Airports"]["Airport"][3]
          ["Position"]["Coordinate"]["Longitude"];
      startLocation = LatLng(originLat.value, originLng.value);
      endLocation = LatLng(destLat.value, destLng.value);
      printInfo(endLocation);
      printInfo(startLocation);
      isLoading(false);
    } else if (response.code == 422) {
      showToastError("An error occured while processing your request");
    } else if (response.code == 500) {
      showToastError("An error occured while processing your request");
    } else {
      showToastError('An error occured');
      isLoading(false);
    }
  }

//method to fetch schedules
  // Future fetchSchedules(String token) async {
  //   isLoading(true);
  //   ResponseModel response = await getSchedules(token);
  //   isLoading(false);
  //   if (response.code == 200) {
  //     showToastSuccess("Data fetched successfully");
  //     printSuccess(response.data);
  //     isLoading(false);
  //   } else if (response.code == 422) {
  //     showToastError("An error occured while processing your request");
  //   } else if (response.code == 500) {
  //     showToastError("An error occured while processing your request");
  //   } else if (response.code == 404) {
  //     showToastError(response.data["messages"][0]["text"]);
  //   } else if (response.code == 400) {
  //     showToastError(response.data["messages"][0]["text"]);
  //   } else {
  //     showToastError('An error occured');
  //     isLoading(false);
  //   }
  // }

//called immediately when controller is allocated memory
  @override
  void onInit() {
    // fetchSchedules(token);
    super.onInit();
  }
}
