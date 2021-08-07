import 'package:flutter/material.dart';
import 'package:gridlines/auth.dart';
import 'package:gridlines/welcomeScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 80),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () async {
                  await Authentication.signOut(context: context);
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => WelcomeScreen()));
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 8.0, bottom: 8.0),
                  child: Text('Sign out'),
                ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'My Teams'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3), label: 'Play Paks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone_android_outlined), label: 'My Plays'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined), label: 'Playbooks')
        ],
      ),
    );
  }
}
