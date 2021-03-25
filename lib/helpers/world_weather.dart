import 'package:http/http.dart';
import 'dart:convert';

class WorldWeather {

  String location,temp;

  WorldWeather({this.location});

  Future<void> getWeather() async {
    try {
      Response response = await get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=${location}&units=metric&appid=c4e6cc0dc104c3f9905e9f4ab98bfa2c'));
      Map data = jsonDecode(response.body);
      temp = (data['main']['temp']).toString();
    }
    catch (error) {
      temp = 'issue with weather api, try again';
    }
  }
}