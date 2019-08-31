import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong/latlong.dart';

class MapBoxPage extends StatefulWidget {
  @override
  _MapBoxPageState createState() => _MapBoxPageState();
}

class _MapBoxPageState extends State<MapBoxPage> {
  LatLng Location;
  List<LatLng> _polyline = [];
//  var Lat,
//  MapOptions _mapOptions;
  String MAP_TOKEN =
      'pk.eyJ1IjoiY2hyaXN0b2NyYWN5IiwiYSI6ImVmM2Y2MDA1NzIyMjg1NTdhZGFlYmZiY2QyODVjNzI2In0.htaacx3ZhE5uAWN86-YNAQ';
  Future getlocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    String lat = position.latitude.toString();
    String Long = position.longitude.toString();
    print(position);
    setState(() {
      Location = LatLng(
          position.latitude, position.longitude); //"Lat: $lat ,Long: $Long";
    });
  }

  @override
  void initState() {
    super.initState();
    getlocation();
    locationnext();
//    _mapOptions = new MapOptions(
//        onPositionChanged: _onPositionChanged,
//        center: _center,
//        zoom: 16.0,
//        onLongPress: _onAddGeofence);
//    _mapController = new MapController();
  }

  buildmap() {}

  locationnext() {
    var geolocator = Geolocator();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);

    StreamSubscription<Position> positionStream = geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      print(position == null
          ? 'Unknown'
          : position.latitude.toString() +
              ', ' +
              position.longitude.toString());

      _polyline.add(LatLng(position.latitude, position.longitude));
    });
  }

  @override
  Widget build(BuildContext context) {
    return new FlutterMap(
      options: new MapOptions(
        center: Location,
        zoom: 13.0,
      ),
      layers: [
        new TileLayerOptions(
          urlTemplate: "https://api.tiles.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken': MAP_TOKEN,
            'id': 'mapbox.streets',
          },
        ),
        new PolylineLayerOptions(
          polylines: [
            new Polyline(
              points: _polyline,
              strokeWidth: 10.0,
              color: Color.fromRGBO(0, 179, 253, 0.8),
            ),
          ],
        ),
        new MarkerLayerOptions(
          markers: [
            new Marker(
              width: 80.0,
              height: 80.0,
              point: Location,
              builder: (ctx) => new Container(
                    child: new FlutterLogo(),
                  ),
            ),
          ],
        ),
      ],
    );
  }
}
