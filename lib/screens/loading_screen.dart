import 'dart:io';

import 'package:clima_app/screens/location_screen.dart';
import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/weather.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    getLocationData();
    super.initState();
  }


  Future<void> getLocationData() async {
    WeatherModel weather = WeatherModel();
    dynamic data = await weather.getLocation();
    navigateToLocationScreen(data);
  }

  void navigateToLocationScreen(dynamic data) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: data)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
        ),
      );

  }
}
