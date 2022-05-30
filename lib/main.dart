import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tecnical_test/Modules/MapPage/map_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MapPage(),
    );
  }
}