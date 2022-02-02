import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'ProfileScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  resetNewLaunch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey("newLaunch")) {
      prefs.setBool('newLaunch', false);
    } else {
      prefs.setBool('newLaunch', false);
    }
  }

  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              resetNewLaunch();
              return const ProfileScreen();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.blue,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Splash Screen',
                      style: new TextStyle(color: Colors.white, fontSize: 40)),
                ],
              ),
            )));
  }
}
