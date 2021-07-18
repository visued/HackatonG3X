import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Google Maps Demo',
//       home: MapTile(),
//     );
//   }
// }

class MapTile extends StatefulWidget {
  @override
  _MapTileState createState() => _MapTileState();
  // State<MapTile> createState() => MapTileState();

}

class _MapTileState extends State<MapTile> {
  Completer<GoogleMapController> _controller  = Completer();

  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(-20.53751000060051, -47.389502931003406),
    zoom: 11.5,
  );

  // GoogleMapController _controller ;
  // Marker _origin;

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);
  // @override
  // void dispose() {
  //   _controller .dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          // mapType: MapType.hybrid,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (GoogleMapController controller) {
          _controller .complete(controller);
        },
          // markers: {
          //   if (_origin != null) _origin,
          // },
          // onLongPress: _addMarker,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.black,
            onPressed: () => _setCamera,
            child: const Icon(Icons.center_focus_strong)));
  }

  // void _addMarker(LatLng pos) {    
  //   setState(() {
  //     print(pos);
  //     _origin = Marker(
  //         markerId: const MarkerId('origin'),
  //         infoWindow: const InfoWindow(title: "origin"),
  //         icon:
  //             BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  //         position: pos);        
  //   });
  // }
  Future<void> _setCamera() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
  }
 
}
