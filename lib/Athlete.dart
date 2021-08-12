import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class Athlete {
  String fName = "";
  String lName = "";
  String email = "";
  String googleId = "";
  DatabaseReference? _id;

  void setId(DatabaseReference id) {
    this._id = id;
  }

  setAthleteAccountID() async {
    // set athlete google id to match firebase user id. google uid = this.googleid;
    // later, when signing in, grab athlete where uid == googleid and pass that user context into the homescreen
  }

  Athlete() {}

  Map<String, dynamic> toJson() {
    return {
      'f_name': this.fName,
      'l_Name': this.lName,
      'Email': this.email,
    };
  }
}
