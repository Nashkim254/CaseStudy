

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tecnical_test/Modules/SplashScreen/controller.dart';

class SplashScreenView extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _SplashScreenView();
  }
}

class _SplashScreenView extends State<SplashScreenView> {
  final controller = Get.put(SplashScreenController());

  @override
  void initState() {
    super.initState();
    controller.loadWidget();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: const Color(0xff000000).withOpacity(0.2)));
    return Scaffold(
      body: Container(
        decoration:const  BoxDecoration(color: Colors.teal),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration:const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const SizedBox(
                height: 150,
                width: 150,
                child: Icon(Icons.location_on,color: Colors.red,size: 100,)),
            ),
          ],
        )),
      ),
    );
  }
}
