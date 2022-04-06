import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Geolocalizacion extends StatefulWidget {
  @override
  GeolocalizacionApp createState() => GeolocalizacionApp();
}

class GeolocalizacionApp extends State<Geolocalizacion> {
  @override
  String currentLocation = '';
  late Position position;
  String localizacion = '';
  TextEditingController local = TextEditingController();
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    //bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    print('************************1');
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    print('************************2');
    if (serviceEnabled) {
      print('************************3');
      // location service is enabled,
    } else {
      // open Location settings
      print('************************4');
      await Geolocator.openLocationSettings();
    }

    if (!serviceEnabled) {
      print('************************5');
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    print('************************6');
    if (permission == LocationPermission.denied) {
      print('************************7');
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('************************8');

        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('************************9');
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    print('************************10');
    print(await Geolocator.getCurrentPosition());
      // local.text = await Geolocator.getCurrentPosition().toString();
    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocalizacion'),
        backgroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(color: Colors.teal[50]),
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Location',
                              ),
                              (currentLocation != null)
                                  ? Text(currentLocation)
                                  : Container(),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              RaisedButton(
                color: Colors.blue[50],
                onPressed: () async {
                  local.text = (await _determinePosition()).toString();

                },
                child: Text("Get Location"),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  enabled: false,
                  controller: local,
                  decoration: InputDecoration(
                    fillColor: Colors.green,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Localización',
                    hintText: 'Localización',
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.blue[50],
                onPressed: () async {
                  local.text = (await _determinePosition()).toString();
                  setState(() {

                  });
                },
                child: Text("Ver clima"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
