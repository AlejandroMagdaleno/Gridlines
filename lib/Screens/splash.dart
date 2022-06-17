import 'package:flutter/material.dart';
import 'package:gridlines/Services/database.dart';
import 'package:gridlines/pak.dart';
import 'package:gridlines/Screens/home.dart';
import 'package:gridlines/Services/auth.dart';

class SplashScreen extends StatefulWidget {
  String email = "";

  SplashScreen(this.email);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List<Pak> currentPaks = [];
  static List<dynamic> styleOfPlay = ['', ''];
  ValueNotifier<List<dynamic>> styleOfPlayNotifier = ValueNotifier(styleOfPlay);

  void fillUrls() {
    getCurrentPlayPaks().then((value) {
      currentPaks = value;
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
            Text("Welcome",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
            SizedBox(
              height: 30,
            ),
            FutureBuilder<bool>(
              future: isNewAthlete(widget.email),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  //print buttons to select style of play if user is new
                  if (snapshot.data! == true) {
                    debugPrint('new user');
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Choose a line up',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      styleOfPlay[0] = '4v4';
                                    });
                                  },
                                  child: Text('4v4')),
                              SizedBox(
                                width: 2,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      styleOfPlay[0] = '5v5';
                                    });
                                  },
                                  child: Text('5v5')),
                              SizedBox(
                                width: 2,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      styleOfPlay[0] = '6v6';
                                    });
                                  },
                                  child: Text('6v6')),
                              SizedBox(
                                width: 2,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      styleOfPlay[0] = '7v7';
                                    });
                                  },
                                  child: Text('7v7')),
                              SizedBox(
                                width: 2,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      styleOfPlay[0] = '8v8';
                                    });
                                  },
                                  child: Text('8v8')),
                              SizedBox(
                                width: 50,
                              ),
                            ],
                          ),
                          Text('Choose a division',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18)),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      styleOfPlay[1] = 'Youth';
                                    });
                                  },
                                  child: Text('Youth')),
                              SizedBox(
                                width: 2,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      styleOfPlay[1] = 'High School';
                                    });
                                  },
                                  child: Text('High School')),
                              SizedBox(
                                width: 2,
                              ),
                              SizedBox(
                                width: 2,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      styleOfPlay[1] = 'CO-ED';
                                    });
                                  },
                                  child: Text('CO-ED')),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      styleOfPlay[1] = 'Collegiate';
                                    });
                                  },
                                  child: Text('Collegiate')),
                              SizedBox(
                                width: 2,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      styleOfPlay[1] = 'Recreation League';
                                    });
                                  },
                                  child: Text('Recreation League')),
                            ],
                          )
                        ],
                      ),
                    );
                  } else {
                    debugPrint('old user');
                    return Text('');
                  }
                } else {
                  return Text('');
                }
              },
            ),
            SizedBox(
              height: 50,
            ),
            ValueListenableBuilder(
                valueListenable: styleOfPlayNotifier,
                builder: (context, List<dynamic> value, _) {
                  return Container(
                    child: Text(
                      value[0] + '-' + value[1],
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  );
                }),
            TextButton(
                onPressed: () {
                  getAthlete(widget.email).then((value) {
                    value.styleOfPlay = (styleOfPlay[0].toString() +
                        " " +
                        styleOfPlay[1].toString());
                    debugPrint(styleOfPlay.toString());
                    updateAthleteData(value);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreen(value, currentPaks)));
                  });
                },
                child: Text("Click to continue"))
          ],
        ),
      ),
    );
  }
}
