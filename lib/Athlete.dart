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

  void setGoogleUser(FirebaseAuth user) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    // from the sign in screen, we run this method if we use the sign in with google button
  }

  void setEmailUser(String fname, String lname, String email) {
    //  Run this method if the user signed up with email
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
