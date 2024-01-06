import 'package:clima_app/services/location.dart';
import 'package:clima_app/services/networking.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherModel {


  Future<void> loadEnv() async {
    try{
      await dotenv.load(fileName: ".env");
    }catch(e){
      print(e);
    }
  }

  Future<dynamic> getCityWeather(String cityName) async {
    await loadEnv();
    String? apiKey = dotenv.env['API_KEY'];
    String uri = 'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
    NetworkService net2 = NetworkService(uri: uri);
    //print(await net2.getData());
    return await net2.getData();
  }

  Future<dynamic> getLocation() async{
    LocationService locate = LocationService();
    await locate.getCurrentLocation();
    await loadEnv();
    String? apiKey = dotenv.env['API_KEY'];
    NetworkService net = NetworkService(uri: 'https://api.openweathermap.org/data/2.5/weather?lat=${locate.lat}&lon=${locate.long}&appid=$apiKey&units=metric');
    print(await net.getData());
    return await net.getData();

  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
