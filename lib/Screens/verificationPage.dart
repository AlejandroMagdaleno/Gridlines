import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gridlines/Screens/home.dart';
import 'package:gridlines/Screens/welcomeScreen.dart';
import 'package:gridlines/database.dart';

class verificationPage extends StatefulWidget {
  String email = "";
  verificationPage(this.email);
  @override
  _verificationPageState createState() => _verificationPageState();
}

class _verificationPageState extends State<verificationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: checkForUser(widget.email),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            debugPrint("loading screen");
            return HomeScreen(widget.email);
          } else {
            return WelcomeScreen();
          }
        },
      ),
    );
  }
}
