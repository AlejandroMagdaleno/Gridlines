import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/Screens/verificationPage.dart';
import 'package:gridlines/Services/auth.dart';
import 'package:gridlines/Services/database.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController pController = TextEditingController(); // password
  final TextEditingController fController =
      TextEditingController(); // first name
  final TextEditingController lController =
      TextEditingController(); // last name
  final TextEditingController eController = TextEditingController(); // email
  final TextEditingController dController =
      TextEditingController(); // display name
  final TextEditingController cController =
      TextEditingController(); // due to change
  final TextEditingController sController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                  padding: EdgeInsets.fromLTRB(30, 0, 20, 20),
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
                          obscureText: true,
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
                              labelText: "Display Name",
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 18)),
                          controller: dController,
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
                              newUser.setUserInfo(
                                  fController.text,
                                  lController.text,
                                  dController.text,
                                  eController.text,
                                  sController.text);
                              newUser.setId(saveAthlete(newUser));
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          verificationPage(eController.text)));
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
