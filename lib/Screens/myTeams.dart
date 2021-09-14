import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/database.dart';

class MyTeams extends StatefulWidget {
  String email = "";
  MyTeams(this.email);
  @override
  _MyTeamsState createState() => _MyTeamsState();
}

class _MyTeamsState extends State<MyTeams> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder(
      future: getAthleteData(widget.email),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Text(snapshot.data.toString());
        } else {
          return Text("data");
        }
      },
    ));
  }
}
