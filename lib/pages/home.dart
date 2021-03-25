import 'dart:ffi';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map dataReceived = {};

  @override
  Widget build(BuildContext context) {

    dataReceived = dataReceived.isEmpty? ModalRoute.of(context).settings.arguments : dataReceived;

    String bgImage = dataReceived['isDay'] ? 'day.jpg' : 'night.png';
    Color bgColor = dataReceived['isDay'] ? Colors.blue : Colors.indigo[700];
    double textSize = 70.0;
    if('The API is gay, try again' == dataReceived['time']){textSize=30.0;}

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
            child: Column(
              children: [
                FlatButton.icon(
                  onPressed: () async{
                  dynamic result = await Navigator.pushNamed(context, '/locations');
                  setState(() {
                    dataReceived = {
                      'time': result['time'],
                      'location': result['location'],
                      'url': result['url'],
                      'isDay': result['isDay'],
                      'flag' : result['flag'],
                    };
                  });
                  },
                  icon: Icon(Icons.edit_location,
                    color: Colors.grey[350],
                    size: 25.0,
                  ),
                  label: Text("Edit Location",
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.grey[350],
                    letterSpacing: 2.0,
                  ),
                  ),
                ),
                SizedBox(height: 50.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/${dataReceived['flag']}'),
                      radius: 20.0,
                    ),
                    SizedBox(width: 15.0,),
                    Text(dataReceived['location'],
                    style: TextStyle(
                      fontSize: 45.0,
                      letterSpacing: 2.0,
                      color: Colors.white70,
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(dataReceived['time'],
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  color: Colors.white70,
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
