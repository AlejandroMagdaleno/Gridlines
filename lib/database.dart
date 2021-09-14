import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

import 'Athlete.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveAthlete(Athlete user) {
  var id = databaseReference.child('Athletes/').push();
  id.set(user.toJson());
  return id;
}

Future<void> checkForUser(String email) async {
  DataSnapshot dataSnapshot = await databaseReference.child('Athletes/').once();
  bool _found = false;
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Athlete existingUser = createAthlete(value);
      existingUser.setId(databaseReference.child('Athletes/' + key));
      if (_found == false) {
        if (existingUser.email == email) {
          debugPrint("found email matching");
          _found = true;
        } else {
          debugPrint("No user exists under the email: " + email);
        }
      }
    });
  } else {
    Athlete newUser = new Athlete();
    newUser.setAthleteEmail(email);
    newUser.setId(saveAthlete(newUser));
  }

// For google sign in, we check for user by passing in user . email and return thatS athlete or create new one
// For logging in with email, we check for user with matching email and return that athlete or create  new one
// If we make it here, we found no athlete with existing email
}

Future<String?> getAthleteData(String email) async {
  DataSnapshot dataSnapshot = await databaseReference.child('Athletes/').once();
  String dbRef = "asdf";
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Athlete existingUser = createAthlete(value);
      existingUser.setId(databaseReference.child('Athletes/' + key));

      if (existingUser.email == email) {
        dbRef = ('Athletes/' + key);
      }
    });
  }
  return dbRef;
  // we need to run this future without a safety check in the return
  //probably wont need to return a database reference since we can access the update
  //method through  databaseReference.child('Athletes/' + key).update. Manually insert
  //the id string
}

// For google sign in, we check for user by passing in user . email and return that athlete or create new one
// For logging in with email, we check for user with matching email and return that athlete or create  new one
// If we make it here, we found no athlete with existing email

void updateAthlete(Athlete athlete, DatabaseReference _id) {
  _id.update(athlete.toJson());
}
