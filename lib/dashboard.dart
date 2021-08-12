import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gridlines/auth.dart';
import 'package:gridlines/welcomeScreen.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        Column(
                          children: <Widget>[
                            Text(
                              'GRIDMASTER CHALLENGER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 3,
                              child: Container(
                                color: Colors.white,
                                width: 220,
                              ),
                            ),
                            Text(
                              'Ranking',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Received',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Issued',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Open',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              'Won',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  fontSize: 15),
                            ),
                          ],
                        )
                      ],
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    decoration: BoxDecoration(color: Colors.green[900]),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
              onPressed: () async {
                await Authentication.signOut(context: context);

                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => WelcomeScreen()));
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
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'I-Am-GridMaster',
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
                        'Name',
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
                        'User email',
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
                    )
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
