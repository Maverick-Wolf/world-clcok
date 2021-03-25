import 'package:flutter/material.dart';
import 'package:world_clock/helpers/world_clock.dart';
import 'package:world_clock/helpers/world_weather.dart';


class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  List<WorldClock> locations = [
    WorldClock(url: 'Asia/Kolkata', location: 'Delhi', flag: 'india.png'),
    WorldClock(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldClock(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldClock(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldClock(url: 'Asia/Tokyo', location: 'Tokyo', flag: 'japan.png'),
    WorldClock(url: 'Europe/Berlin', location: "Berlin", flag:'germany.png'),
    WorldClock(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldClock(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldClock(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldClock(url: 'Asia/Kolkata', location: 'Mumbai', flag: 'india.png'),
  ];

  void updateTime(index) async{
    WorldClock fullData = locations[index];
    WorldWeather fullData_2 = WorldWeather(location: locations[index].location);
    await fullData.getTime();
    await fullData_2.getWeather();
    Navigator.pop(context, {
      'location': fullData.location,
      'time': fullData.time,
      'url': fullData.url,
      'isDay': fullData.isDay,
      'flag': fullData.flag,
      'temp': fullData_2.temp,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Choose Location',
        style: TextStyle(
          letterSpacing: 2.0,
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
          color: Colors.white70
        ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 5.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0,10.0,0.0,10.0),
                child: ListTile(
                  tileColor: Colors.grey[350],
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
