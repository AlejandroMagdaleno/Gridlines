import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/database.dart';

class MyTeams extends StatefulWidget {
  const MyTeams({Key? key}) : super(key: key);

  @override
  _MyTeamsState createState() => _MyTeamsState();
}

class _MyTeamsState extends State<MyTeams> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: checkForUser("alxmg179@gmail.com"),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Text('Data: ${snapshot.data.toString()}');
          } else if (snapshot.hasData) {
            return Text(snapshot.data.toString());
          } else
            return Text('asdf');

          // need to print snapshot data
        },
      ),
    );
  }
}
