import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tecnical_test/Helpers/alerts.dart';
import 'package:tecnical_test/Modules/MapPage/controller.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final cont = Get.put(MapPageController());
  GoogleMapController? mapController; //contrller for Google map
  PolylinePoints polylinePoints = PolylinePoints();

//google API key for maps and directions
  String googleAPiKey = "AIzaSyBFlheim79TYkUacXtPq-x4TCHDZsk_Jlg";

  //These are the origin and destination airport variables that would be assigned once api call is done
  late LatLng startLocation;
  late LatLng endLocation;
  Set<Marker> markers = {}; //markers for google map
  Map<PolylineId, Polyline> polylines = {}; //polylines to show direction

  @override
  void initState() {
    // cont.getAirlines(5, cont.token);
    cont.getAirlines(5, cont.token);

    Future.delayed(const Duration(seconds: 5), () {
// Here you can write your code

      startLocation = cont.startLocation;
      endLocation = cont.endLocation;
      printError(startLocation);
      printError(endLocation);
      markers.add(Marker(
        //add start location marker
        markerId: MarkerId(cont.startLocation.toString()),
        position: cont.startLocation, //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Origin ',
          snippet: 'Origin Marker',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      markers.add(Marker(
        //add distination location marker
        markerId: MarkerId(cont.endLocation.toString()),
        position: cont.endLocation, //position of marker
        infoWindow: const InfoWindow(
          //popup info
          title: 'Destination Point ',
          snippet: 'Destination Marker',
        ),
        icon: BitmapDescriptor.defaultMarker, //Icon for Marker
      ));

      getDirections();
    });
//fetch direction polylines from Google API

    super.initState();
  }

  getDirections() async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(cont.startLocation.latitude, cont.startLocation.longitude),
      PointLatLng(cont.endLocation.latitude, cont.endLocation.longitude),
      travelMode: TravelMode.driving,
    );

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.teal,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Directions and Map"),
          backgroundColor: Colors.teal,
        ),
        body: cont.isLoading.value == true
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GoogleMap(
                //Map widget from google_maps_flutter package
                zoomGesturesEnabled: true, //enable Zoom in, out on map
                initialCameraPosition: CameraPosition(
                  //innital position in map
                  target: cont.startLocation, //initial position
                  zoom: 2.0, //initial zoom level
                ),
                markers: markers, //markers to show on map
                polylines: Set<Polyline>.of(polylines.values), //polylines
                mapType: MapType.normal, //map type
                onMapCreated: (controller) {
                  //method called when map is created
                  setState(() {
                    mapController = controller;
                  });
                },
              ),
      );
    });
  }
}
