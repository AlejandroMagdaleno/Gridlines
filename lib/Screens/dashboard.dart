import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/Screens/welcomeScreen.dart';
import 'package:gridlines/Services/auth.dart';

class Dashboard extends StatefulWidget {
  Athlete user = new Athlete();
  Dashboard(Athlete athlete) {
    this.user = athlete;
  }
  List<String> attributes = [];
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isPlayer = false;
  bool _isCoach = false;
  bool _isAdmin = false;
  //bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey, width: 5),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      'https://googleflutter.com/sample_image.jpg'),
                                  fit: BoxFit.fill)),
                        ),
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(color: Colors.green[800]),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[700]),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
              onPressed: () {},
              child: Padding(
                padding: EdgeInsets.only(top: 1),
                child: Text(
                  "Issue Grid Challenge",
                  style: TextStyle(
                      fontSize: 15, color: Colors.white, letterSpacing: 1),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.user.displayName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.black,
                      indent: 0,
                      endIndent: 100,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.user.fName + ' ' + widget.user.lName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.black,
                      indent: 0,
                      endIndent: 100,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.user.email,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        )),
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.black,
                      indent: 0,
                      endIndent: 100,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'State, USA',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.black,
                      indent: 0,
                      endIndent: 100,
                    ),
                    Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              'Player',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Coach',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              'Admin',
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                          width: 20,
                        ),
                        Column(
                          children: <Widget>[
                            Switch(
                              value: _isPlayer,
                              onChanged: (value) {
                                setState(() {
                                  _isPlayer = value;
                                });
                              },
                              activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.green,
                            ),
                            Switch(
                              value: _isCoach,
                              onChanged: (value) {
                                setState(() {
                                  _isCoach = value;
                                });
                              },
                              activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.green,
                            ),
                            Switch(
                              value: _isAdmin,
                              onChanged: (value) {
                                setState(() {
                                  _isAdmin = value;
                                });
                              },
                              activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.green,
                            ),
                          ],
                        ),
                      ],
                    ),
                    /*
                    Divider(
                      height: 20,
                      thickness: 1,
                      color: Colors.black,
                      indent: 0,
                      endIndent: 100,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Allow profile to be visible',
                          style: TextStyle(fontSize: 18),
                        ),
                        Switch(
                          value: _isVisible,
                          onChanged: (value) {
                            setState(() {
                              _isVisible = value;
                            });
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                        ),
                      ],
                    ),*/
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)))),
                      onPressed: () async {
                        await Authentication.signOut(context: context);

                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => WelcomeScreen()));
                      },
                      child: Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          "Sign out",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
