import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkService{
  final String uri;
  NetworkService({required this.uri});




  Future getData() async{
    try {
      Uri url = Uri.parse(uri);
      http.Response res = await http.get(url);
      return jsonDecode(res.body);
    }catch(e){
      print(e);
    }
  }
}