import 'package:animazing/Services/AppBlocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';

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
    final appBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold( 
      body: (appBloc.currentLocation == null)
      ? Center (
        child: CircularProgressIndicator(), 
      )
      : ListView (
        children: [
        Container (
        height: 300,
        width: 500,
        child: GoogleMap(/*
          initialCameraPosition: CameraPosition(
            target: LatLng(-1.4437121, -48.4630365),
            zoom: 11.0,*/
            initialCameraPosition: CameraPosition(target: LatLng(appBloc.currentLocation.latitude, appBloc.currentLocation.longitude), zoom:11.0,),
            mapType: MapType.normal,
            myLocationEnabled: true,
          ),
        ),
        ],
        ),
      );
  }
}
