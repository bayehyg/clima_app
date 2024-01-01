import 'package:clima_app/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    getLocation();
    super.initState();
  }

  void getLocation() async {
    LocationService locate = LocationService();
    await locate.getCurrentLocation();
    print(locate.lat);
    print(locate.long);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}
