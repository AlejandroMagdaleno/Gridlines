import 'package:firebase_database/firebase_database.dart';
import 'package:gridlines/Services/database.dart';

class Athlete {
  String fName = "";
  String lName = "";
  String displayName = "";
  String email = "";
  String styleOfPlay = "";

  DatabaseReference? id;

  DatabaseReference getID() {
    return this.id!;
  }

  void setId(DatabaseReference id) {
    this.id = id;
  }

  void setUserInfo(
      String first, String last, String display, String email, String style) {
    this.fName = first;
    this.lName = last;
    this.displayName = display;
    this.email = email;
    this.styleOfPlay = style;
  }

  Map<String, dynamic> toJson() {
    return {
      'first': this.fName,
      'last': this.lName,
      'display_name': this.displayName,
      'email': this.email,
      'styleOfPlay': this.styleOfPlay
    };
  }
}

Athlete createAthlete(record) {
  Map<String, dynamic> attributes = {
    'first': '',
    'last': '',
    'display_name': '',
    'email': '',
    'styleOfPlay': '',
  };

  record.forEach((key, value) => {attributes[key] = value});
  Athlete athlete = new Athlete();
  athlete.fName = attributes['first'];
  athlete.lName = attributes['last'];
  athlete.displayName = attributes['display_name'];
  athlete.email = attributes['email'];
  athlete.styleOfPlay = attributes['styleOfPlay'];
  return athlete;
}
