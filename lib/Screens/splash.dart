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
  List<String> pakUrls = []; // replicate

  void fillUrls() {
    getPlayPakFetched().then((value) {
      pakUrls = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    fillUrls();
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
                        builder: (context) => HomeScreen(value, pakUrls)));
                  });
                },
                child: Text("Click to continue"))
          ],
        ),
      ),
    );
  }
}
