



import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecnical_test/Modules/MapPage/map_page.dart';

class SplashScreenController extends GetxController {
  bool isLoading = false;


  var today = DateTime.now();
  final splashDelay = 3;
  bool visitor = true;
  bool loggedIn = false;

void setLoader(){
  isLoading = true;
  update();
}

void onInit(){
  super.onInit();
}
 
 String splashLogo(BuildContext context){
    return Theme.of(context).brightness == Brightness.light ? "assets/images/new_logo.png" : "assets/images/new_logo.png";
  }



 Future loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, goToApp);
  }

  Future<void> goToApp() async {
 

    if (visitor) {
      Get.off(() =>  MapPage(),
          curve: Curves.fastOutSlowIn,
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 1500));

    } 
  }

}
