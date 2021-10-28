import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gridlines/Screens/signup.dart';
import 'package:gridlines/Screens/verificationPage.dart';

import '../auth.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/field.jpg"),
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.90), BlendMode.dstATop)),
        ),
        child: Column(
          children: <Widget>[
            Container(
                padding: EdgeInsets.fromLTRB(30, 30, 20, 20),
                child: Image.asset('images/grid.png')),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Sign in",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        labelStyle:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 18)),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        labelStyle:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 18)),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(),
                child: TextButton(
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {},
                )),
            Container(
              child: SizedBox(
                  height: 200,
                  width: 150,
                  child: IconButton(
                    iconSize: 100,
                    padding: EdgeInsets.all(0.0),
                    icon: Image.asset('images/signwithgoogle.png'),
                    onPressed: () async {
                      User? user = await Authentication.signInWithGoogle(
                          context: context);
                      // take the user signed in, and
                      //only create an athlete account if one does not exist
                      if (user != null) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) =>
                                verificationPage(user.email!)));
                      }
                    },
                  )),
            ),
            Container(
                padding: EdgeInsets.only(top: 0),
                child: TextButton(
                  child: Text(
                    "Don't have an account? Sign up here",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SignUp()));
                  },
                )),
          ],
        ),
      ),
    );
  }
}