import 'package:flutter/material.dart';

class WaitScreen extends StatelessWidget {
  final blackColor = Color(0xFF1C1C1C);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/loading.gif'),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 500.0, 0.0, 0.0),
            child: Text("grabbing data from the api please wait...",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
            ),
          ),
        ),
      ),
    );
  }
}
