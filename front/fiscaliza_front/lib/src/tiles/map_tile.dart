import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';



class MapTile extends StatefulWidget {
  @override
  _MapTileState createState() => _MapTileState();
  // State<MapTile> createState() => _MapTileState();

}

class _MapTileState extends State<MapTile> {
  Completer<GoogleMapController> _googleMapController = Completer();
  
  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(-20.53751000060051, -47.389502931003406),
    zoom: 11.5,
  );

  // GoogleMapController _googleMapController;
  // Marker _origin;



  // @override
  // void initState() {
  //   super.initState();
  //   _origin.whenComplete();
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
          _googleMapController.complete(controller);
        },
          // markers: {
          //   if (_origin != null) _origin,
          // },
          // onLongPress: _addMarker,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            foregroundColor: Colors.black,
            onPressed: () => _centraliza,
            child: const Icon(Icons.center_focus_strong)));
  }

  Future<void> _centraliza() async {
    final GoogleMapController controller = await _googleMapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
  }
//   void _addMarker(LatLng pos) {    
//     setState(() {
//       print(pos);
//       _origin = Marker(
//           markerId: const MarkerId('origin'),
//           infoWindow: const InfoWindow(title: "origin"),
//           icon:
//               BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
//           position: pos);        
//     });
//   }
}
