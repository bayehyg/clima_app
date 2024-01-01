import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class NetworkService{
  final lat;
  final long;
  NetworkService({this.lat, this.long});

  Future<void> loadEnv() async {
    try{
      await dotenv.load(fileName: ".env");
    }catch(e){
      print(e);
    }
  }


  Future getData() async{
    try {
      await loadEnv();
      String? apiKey = dotenv.env['API_KEY'];
      Uri url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey');
      http.Response res = await http.get(url);
      return jsonDecode(res.body);
    }catch(e){
      print(e);
    }
  }
}