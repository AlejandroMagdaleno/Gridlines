import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';

class Athlete {
  String fName = "";
  String lName = "";
  String? displayName;
  String? email;
  DatabaseReference? _id;

  void setId(DatabaseReference id) {
    this._id = id;
  }

  void setAthleteDName(String? name) {
    this.displayName = name;
  }

  void setAthleteEmail(String? email) {
    // when a google user is created. pass in the email to the new athlete object made to store the email locally.
    this.email = email;
  }

  Athlete() {}

  Map<String, dynamic> toJson() {
    return {
      'display_name': this.displayName,
      'f_name': this.fName,
      'l_Name': this.lName,
      'email': this.email,
    };
  }
}
