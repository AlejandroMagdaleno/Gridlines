import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Athlete {
  String fName = "";
  String lName = "";
  String email = "";
  DatabaseReference? _id;

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Athlete(String fname, String lname, String email) {
    //  Run this method if the user signed up with email
    //  Possibly good to use for google user as well since google user only returns full display name. Find a way to get the parsed first and last name from user by asking for it
    this.fName = fname;
    this.lName = lname;
    this.email = email;
  }

  Map<String, dynamic> toJson() {
    return {
      'f_name': this.fName,
      'l_Name': this.lName,
      'Email': this.email,
    };
  }
}
