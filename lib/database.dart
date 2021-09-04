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

Future<Athlete?> checkForUser(String email) async {
  DataSnapshot dataSnapshot = await databaseReference.child('Athletes/').once();
  Athlete athlete = new Athlete();
  bool _found = false;
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Athlete existingUser = createAthlete(value);
      existingUser.setId(databaseReference.child('Athletes/' + key));

      if (existingUser.email == email) {
        debugPrint(existingUser.email);
        athlete = existingUser;
        _found = true;
      } else {
        debugPrint("No user exists under the email: " + email);
        _found = false;
      }
    });
  }

  if (_found == false) {
    athlete.setAthleteEmail(email);
    athlete.setId(saveAthlete(athlete));
    return athlete;
  } else {
    debugPrint("Successfully returned user email: " + athlete.email.toString());
    return athlete;
  }

// For google sign in, we check for user by passing in user . email and return that athlete or create new one
// For logging in with email, we check for user with matching email and return that athlete or create  new one
// If we make it here, we found no athlete with existing email
}
