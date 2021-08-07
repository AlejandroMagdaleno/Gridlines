import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class _User {
  String fName = "";
  String lName = "";
  String email = "";

  _User(String fname, String lName, String email) {
    this.fName = fName;
    this.lName = lName;
    this.email = email;
  }

  void welcomeUser() {
    debugPrint(fName + lName);
  }
}
