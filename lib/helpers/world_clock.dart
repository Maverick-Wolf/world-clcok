import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldClock {

  String location,time,flag,url;
  bool isDay=false;

  WorldClock({this.location,this.url,this.flag});

  Future<void> getTime() async {
    try {
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      DateTime now = DateTime.parse(datetime);
      String hours = data['utc_offset'].substring(1,3);
      String minutes = data['utc_offset'].substring(4,6);

      now = now.add(Duration(hours: int.parse(hours), minutes: int.parse(minutes)));
      isDay = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);
    }
    catch (error) {
      time = 'The API is gay, try again';
    }
  }
}