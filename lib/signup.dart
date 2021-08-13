import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/auth.dart';
import 'package:gridlines/database.dart';
import 'package:gridlines/home.dart';
import 'package:gridlines/welcomeScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController pController = TextEditingController();
  final TextEditingController fController = TextEditingController();
  final TextEditingController lController = TextEditingController();
  final TextEditingController eController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = 1;
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
                child: Text(
                  "Sign up",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: height, left: 20, right: 20),
                  child: TextField(
                    controller: pController,
                    decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle:
                            TextStyle(fontFamily: 'Monteserrat', fontSize: 18)),
                  )),
              Container(
                  padding: EdgeInsets.only(top: height, left: 20, right: 20),
                  child: TextFormField(
                    controller: fController,
                    decoration: InputDecoration(
                        labelText: "First Name",
                        labelStyle:
                            TextStyle(fontFamily: 'Monteserrat', fontSize: 18)),
                  )),
              Container(
                  padding: EdgeInsets.only(top: height, left: 20, right: 20),
                  child: TextFormField(
                    controller: lController,
                    decoration: InputDecoration(
                        labelText: "Last name",
                        labelStyle:
                            TextStyle(fontFamily: 'Monteserrat', fontSize: 18)),
                  )),
              Container(
                  padding: EdgeInsets.only(top: height, left: 20, right: 20),
                  child: TextFormField(
                    controller: eController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle:
                            TextStyle(fontFamily: 'Monteserrat', fontSize: 18)),
                  )),
              Container(
                  padding: EdgeInsets.only(top: height, left: 20, right: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                        labelText: "State",
                        labelStyle:
                            TextStyle(fontFamily: 'Monteserrat', fontSize: 18)),
                  )),
              Container(
                  padding: EdgeInsets.only(top: height, left: 20, right: 20),
                  child: TextField(
                    decoration: InputDecoration(
                        labelText: "Country",
                        labelStyle:
                            TextStyle(fontFamily: 'Monteserrat', fontSize: 18)),
                  )),
              SizedBox(height: 45),
              Container(
                child: TextButton(
                  child: Text(
                    'Create Account',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Authentication auth = new Authentication();
                    auth.signUp(
                        email: eController.text, password: pController.text);
                    Athlete newUser = new Athlete();
                    newUser.setAthleteEmail(eController.text);
                    newUser.setAthleteDName(newUser.displayName);
                    newUser.setId(saveAthlete(newUser));

                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreen(newUser)));
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
              )
            ],
          ),
        ));
  }
}
