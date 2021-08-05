import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gridlines/signup.dart';

import 'auth.dart';

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
            SizedBox(height: 30),
            Container(
              child: TextButton(
                child: Text(
                  'Sign in with google',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  User? user =
                      await Authentication.signInWithGoogle(context: context);

                  if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => WelcomeScreen()));
                  }
                },
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(width: 2, color: Colors.green.shade900)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 10, horizontal: 50)),
                    textStyle:
                        MaterialStateProperty.all(TextStyle(fontSize: 20))),
              ),
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
                    _navigateToSignUpScreen(context);
                  },
                )),
          ],
        ),
      ),
    );
  }
}

void _navigateToSignUpScreen(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
}
