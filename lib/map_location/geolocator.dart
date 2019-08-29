import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocatorPage extends StatefulWidget {
  @override
  _GeolocatorPageState createState() => _GeolocatorPageState();
}

class _GeolocatorPageState extends State<GeolocatorPage> {
  String Location;
  @override
  Widget build(BuildContext context) {
    Future getlocation() async {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      String lat = position.latitude.toString();
      String Long = position.longitude.toString();
      print(position);
      setState(() {
        Location = "Lat: $lat ,Long: $Long";
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("GetLocation"),
      ),
      body: Center(
          child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () => getlocation(),
            color: Colors.red,
            child: Text("Getlocation",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold)),
          ),
          Text('Location: $Location'),
          Card()
        ],
      )),
    );
  }
}
