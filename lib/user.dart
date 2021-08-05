import 'package:flutter/cupertino.dart';

class User_ {
  String fName = "";
  String lName = "";
  String email = "";

  User(String fName, String lName, String email) {
    this.fName = fName;
    this.lName = lName;
    this.email = email;
  }

  void welcomeUser() {
    debugPrint(fName + lName);
  }
}
