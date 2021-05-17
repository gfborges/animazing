import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  // TODO: usar Places API
  GoogleMapController googleMapsController;
  LatLng initialcameraposition = LatLng(-1.4437121, -48.4630365);
  Location location = Location();

  void _onMapCreated(GoogleMapController _cntlr)
  {
    googleMapsController = _cntlr;
    location.onLocationChanged.listen((l) { 
      googleMapsController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude),zoom: 15),
          ),
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Container( 
      height: 500,
      width: 500,
      child: Center(
        child: GoogleMap(/*
          initialCameraPosition: CameraPosition(
            target: LatLng(-1.4437121, -48.4630365),
            zoom: 11.0,*/
            initialCameraPosition: CameraPosition(target: initialcameraposition),
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true
          ),
        ),
      );
  }
}
