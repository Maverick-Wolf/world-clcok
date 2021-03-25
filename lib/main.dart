import 'package:flutter/material.dart';
import 'package:world_clock/pages/home.dart';
import 'package:world_clock/pages/loading.dart';
import 'package:world_clock/pages/locations.dart';
import 'package:world_clock/pages/wait.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => LoadingScreen(),
      '/home': (context) => HomeScreen(),
      '/locations': (context) => LocationScreen(),
      '/wait': (context) => WaitScreen(),
    },
  ));
}

