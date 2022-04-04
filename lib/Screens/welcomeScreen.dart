import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gridlines/Screens/signup.dart';
import 'package:gridlines/Screens/verificationPage.dart';
import 'package:gridlines/Services/auth.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController eController = new TextEditingController();
  TextEditingController pController = new TextEditingController();
  final formKey = GlobalKey<FormState>();
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
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Sign in form",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 18),
                          border: OutlineInputBorder()),
                      controller: eController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Empty field';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                          labelText: "Password",
                          labelStyle:
                              TextStyle(color: Colors.white, fontSize: 18),
                          border: OutlineInputBorder()),
                      controller: pController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Empty field';
                        }
                        return null;
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    Authentication auth = new Authentication();

                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .signInWithEmailAndPassword(
                              email: eController.text,
                              password: pController.text);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) =>
                              verificationPage(eController.text)));
                    } on FirebaseAuthException catch (e) {
                      debugPrint(e.message);
                    }
                  }
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    "Sign in",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 2),
                  ),
                ),
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
              // fix sizing issue with the button
              child: IconButton(
                iconSize: 100,
                padding: EdgeInsets.all(0.0),
                icon: Image.asset('images/signwithgoogle.png'),
                onPressed: () async {
                  User? user =
                      await Authentication.signInWithGoogle(context: context);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => verificationPage(user.email!)));
                  }
                },
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 50),
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
