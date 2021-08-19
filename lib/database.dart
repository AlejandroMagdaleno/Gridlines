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

Future<Athlete> checkForUser(User user) async {
  DataSnapshot dataSnapshot = await databaseReference.child('Athletes/').once();

  Athlete newAthlete = new Athlete();

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Athlete existingUser = createAthlete(value);
      existingUser.setId(databaseReference.child('Athletes/' + key));

      // Look for a user in the database with the same email
      // and return that athlete
      if (existingUser.email == user.email) {
        debugPrint("this user exists already");
        newAthlete = existingUser;
        return existingUser;
      }
    });
  }
  // If we make it here, we found no athlete with existing email
  // create a new account
  newAthlete.setAthleteEmail(user.email);
  newAthlete.setAthleteDName(user.displayName);
  newAthlete.setId(saveAthlete(newAthlete));
  return newAthlete;
}
