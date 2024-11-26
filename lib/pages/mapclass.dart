import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  String? _maptheme; // Nullable to handle loading
  final Map<MarkerId, Marker> markers = {}; // Store markers



  Future _loadMapStyle() async{
    _maptheme = await rootBundle.loadString("lib/raw/mapsThem.Json");
  }


  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng( 27.669943, 85.320404),
    zoom: 14.4746,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createlistofmarker();
    _loadMapStyle();
  }

  createlistofmarker() {
    for (int i = 0; i < 10; i++) {
      final double increment = i + 0.8;
      final marker = Marker(
        markerId: MarkerId(increment.toString()),

        position:  LatLng(9.66911 - (0.02 * i), 80.014007 - (0.02 * i)),
        infoWindow:  InfoWindow(
          title: 'T' + increment.toString(),
          snippet: 'A' + increment.toString(),
        ),
      );
      setState(() {
        markers [MarkerId(increment.toString())] = marker;

      });

    }
  }



  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  Map<MarkerId, Marker>marker = <MarkerId, Marker>{};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          controller.setMapStyle(_maptheme);
        },

        markers: markers.values.toSet(),

        // markers: {
        //   const Marker(
        //     markerId: MarkerId('Patan'),
        //     position: LatLng(27.6683, 85.3206),
        //     infoWindow: InfoWindow(
        //       title: "Patan"
        //     )
        //   )
        // },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}