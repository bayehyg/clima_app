import 'package:geolocator/geolocator.dart';
class LocationService{

  double? lat;
  double? long;

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    try{
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw 'location services not enabled';
      }
      permission = await Geolocator.checkPermission();
      if(permission == LocationPermission.denied){
        permission= await Geolocator.requestPermission();
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
        lat = position.latitude;
        long = position.longitude;
        return;
      }
      if(permission != LocationPermission.denied){
        Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
        lat = position.latitude;
        long = position.longitude;
      }
    }catch(e){
      throw "Couldn't find location";
    }
  }
}
