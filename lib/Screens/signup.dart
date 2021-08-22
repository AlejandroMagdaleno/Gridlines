import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/auth.dart';
import 'package:gridlines/database.dart';
import 'package:gridlines/Screens/home.dart';
import 'package:gridlines/Screens/welcomeScreen.dart';

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
  final TextEditingController sController = TextEditingController();
  final TextEditingController cController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
              Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 350,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          controller: pController,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 6) {
                              return 'Password minimum 6 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 350,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "First name",
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          controller: fController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 350,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Last name",
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          controller: lController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 350,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Email",
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          controller: eController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 350,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "State",
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          controller: sController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: 350,
                        child: TextFormField(
                          decoration: InputDecoration(
                              labelText: "Country",
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          controller: cController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return null;
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: ElevatedButton(
                          child: Text("Create account"),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Authentication auth = new Authentication();
                              auth.signUp(
                                  email: eController.text,
                                  password: pController.text);
                              Athlete newUser = new Athlete();
                              newUser.setAthleteEmail(eController.text);
                              newUser.setAthleteDName(newUser.displayName);
                              newUser.setId(saveAthlete(newUser));
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                            }
                          },
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}
