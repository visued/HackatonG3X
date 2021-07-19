import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTile extends StatefulWidget {
  final Function? addLatLg;
  MapTile({this.addLatLg});
  @override
  _MapTileState createState() => _MapTileState();
}

class _MapTileState extends State<MapTile> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(-20.53674728183014, -47.40053177518627),
    zoom: 15.5,
  );

  Marker _origin = Marker(
    markerId: MarkerId("1"),
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          // mapType: MapType.hybrid,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: {
            if (_origin != null) _origin,
          },
          onLongPress: _addMarker,
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).highlightColor,
            foregroundColor: Colors.black,
            onPressed: () => _setCamera(),
            child: const Icon(Icons.center_focus_strong)));
  }

  void _addMarker(LatLng pos) {
    setState(() {
      _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: "origin"),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos);
    });
    this.widget.addLatLg!("${pos.longitude} ${pos.latitude}");
  }

  Future<void> _setCamera() async {
    final GoogleMapController controller = await _controller.future;
    controller
        .animateCamera(CameraUpdate.newCameraPosition(_initialCameraPosition));
  }
}
