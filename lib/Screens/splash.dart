import 'package:flutter/material.dart';
import 'package:gridlines/Screens/home.dart';
import 'package:gridlines/database.dart';

class SplashScreen extends StatefulWidget {
  String email = "";

  SplashScreen(this.email);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),
            Text("Welcome"),
            TextButton(
                onPressed: () {
                  getAthlete(widget.email).then((value) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreen(value)));
                  });
                },
                child: Text("Click to continue"))
          ],
        ),
      ),
    );
  }
}
