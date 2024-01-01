import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';
import 'package:flutter/material.dart';



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
  late double lat;
  late double long;


  Future<void> getLocationData() async {
    LocationService locate = LocationService();
    await locate.getCurrentLocation();
    lat = locate.lat!;
    long = locate.long!;
    NetworkService net = NetworkService(lat: lat, long: long);
    var weatherData = await net.getData();
    print(weatherData);
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
