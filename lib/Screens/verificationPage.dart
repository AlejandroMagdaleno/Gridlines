import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/Screens/splash.dart';
import 'package:gridlines/Screens/welcomeScreen.dart';
import 'package:gridlines/database.dart';

class verificationPage extends StatefulWidget {
  String email = "";
  verificationPage(this.email);
  @override
  _verificationPageState createState() => _verificationPageState();
}

class _verificationPageState extends State<verificationPage> {
  Athlete athlete = new Athlete();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: FutureBuilder(
        future: checkForUser(widget.email),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return SplashScreen(widget.email);
          } else {
            return WelcomeScreen();
          }
        },
      ),
    ));
  }
}
