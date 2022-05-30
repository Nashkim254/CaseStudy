import 'package:get/get.dart';
import 'package:tecnical_test/Api/requests.dart';
import 'package:tecnical_test/Helpers/alerts.dart';
import 'package:tecnical_test/Models/response_model.dart';

class MapPageController extends GetxController {
  //an observable boolean isLoading
  var isLoading = false.obs;
  //token to authorize api requests to lufthansa
  String token = "b8wjxp2cwx85pgjrdnr3hyk7";

  //Method to fetch all airlines info
  Future getAirlines(int limit, String token) async {
    isLoading(true);
    ResponseModel response = await getAirports(limit, token);
    isLoading(false);
    if (response.code == 200) {
      showToastSuccess("Data fetched successfully");
      printSuccess(response.data);
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

//called immediately when controller is allocated memory
  @override
  void onInit() {
    getAirlines(5, token);
    super.onInit();
  }
}
