import 'package:flutter/material.dart';
import 'welcomeScreen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbGrid = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: _fbGrid,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print("Error");
              return (Text('something went wrong'));
            } else if (snapshot.hasData) {
              print('snapshot has data, firebase went through ideally');
              return WelcomeScreen();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
