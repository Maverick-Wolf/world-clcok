import 'package:flutter/material.dart';
import 'package:world_clock/helpers/world_clock.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  void setUp() async{
    WorldClock instance = WorldClock(location: "Berlin", url: 'Europe/Berlin', flag:'germany.png');
    await instance.getTime();
    await Future.delayed(Duration(seconds: 2), (){});
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'time': instance.time,
      'url': instance.url,
      'isDay': instance.isDay,
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
          child: Image.network("https://i.pinimg.com/originals/04/00/f1/0400f1ae341070283f5441097ef96d39.gif"),
        ),
      ),
    );
  }
}
