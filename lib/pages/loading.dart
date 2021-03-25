import 'package:flutter/material.dart';
import 'package:world_clock/helpers/world_clock.dart';
import 'package:world_clock/helpers/world_weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void setUp() async{
    WorldClock instance = WorldClock(location: "Berlin", url: 'Europe/Berlin', flag:'germany.png');
    WorldWeather instance_2 = WorldWeather(location: "Berlin");
    await instance.getTime();
    await instance_2.getWeather();
    await Future.delayed(Duration(seconds: 2), (){});
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'url': instance.url,
      'isDay': instance.isDay,
      'flag': instance.flag,
      'temp': instance_2.temp,
    });
  }

  @override
  void initState() {
    super.initState();
    setUp();
  }
  static const BlackColor = Color(0xFF1C1C1C);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BlackColor,
      body: SafeArea(
        child: Center(
          child: Image.asset('assets/loading.gif'),
        ),
      ),
    );
  }
}
