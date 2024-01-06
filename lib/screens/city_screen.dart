import 'package:flutter/material.dart';
import 'package:clima_app/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: TextButton(
                  onPressed: () {Navigator.pop(context);},
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  autocorrect: true,
                  onChanged: (value){
                    cityName = value;
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    suffixIcon: IconButton(icon: Icon(Icons.arrow_upward_sharp,color: Colors.black,),
                      onPressed: () {
                        Navigator.pop(context, cityName);
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    icon: Icon(Icons.location_city, color: Colors.white,),
                    hintText: 'Enter city name',
                    hintStyle: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
