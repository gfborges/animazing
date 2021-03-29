import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsPage extends StatefulWidget {
  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  // TODO: usar Places API
  GoogleMapController googleMapsController;
  
  @override
  Widget build(BuildContext context) {
    return Container( 
      height: 500,
      width: 500,
      child: Center(
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(-1.4437121, -48.4630365),
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
