import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/database.dart';

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
                  child: TextField(
                    controller: fController,
                    decoration: InputDecoration(
                        labelText: "First Name",
                        labelStyle:
                            TextStyle(fontFamily: 'Monteserrat', fontSize: 18)),
                  )),
              Container(
                  padding: EdgeInsets.only(top: height, left: 20, right: 20),
                  child: TextField(
                    controller: lController,
                    decoration: InputDecoration(
                        labelText: "Last name",
                        labelStyle:
                            TextStyle(fontFamily: 'Monteserrat', fontSize: 18)),
                  )),
              Container(
                  padding: EdgeInsets.only(top: height, left: 20, right: 20),
                  child: TextField(
                    controller: eController,
                    decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle:
                            TextStyle(fontFamily: 'Monteserrat', fontSize: 18)),
                  )),
              Container(
                  padding: EdgeInsets.only(top: height, left: 20, right: 20),
                  child: TextField(
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
                    Athlete newUser = new Athlete();
                    newUser.setId(saveAthlete(newUser));
                    newUser.setEmailUser(
                        fController.text, lController.text, eController.text);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Column(
                              children: <Widget>[
                                Text("Password: " + pController.text),
                                Text("First name: " + fController.text),
                                Text("Last name: " + lController.text),
                                Text("Email: " + eController.text)
                              ],
                            ),
                          );
                        });
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
