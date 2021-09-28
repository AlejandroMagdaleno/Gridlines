import 'package:firebase_database/firebase_database.dart';
import 'package:gridlines/database.dart';

class Athlete {
  String fName = "";
  String lName = "";
  String displayName = "";
  String email = "";

  DatabaseReference? _id;

  DatabaseReference getID(Athlete athlete) {
    return athlete._id!;
  }

  void update() {
    updateAthleteData(email);
  }

  void setId(DatabaseReference id) {
    this._id = id;
  }

  void setAthleteEmail(String? email) {
    // when a google user is created. pass in the email to the new athlete object made to store the email locally.
    this.email = email!;
  }

  Map<String, dynamic> toJson() {
    return {
      'display_name': this.displayName,
      'f_name': this.fName,
      'l_Name': this.lName,
      'email': this.email,
    };
  }
}

Athlete createAthlete(record) {
  Map<String, dynamic> attributes = {
    'display_name': '',
    'f_name': '',
    'l_Name': '',
    'email': '',
  };

  record.forEach((key, value) => {attributes[key] = value});
  Athlete athlete = new Athlete();
  //athlete.displayName = attributes['display_name'];
  //athlete.fName = attributes['f_name'];
  //athlete.lName = attributes['l_name'];
  athlete.setAthleteEmail(attributes['email']);
  return athlete;
}
