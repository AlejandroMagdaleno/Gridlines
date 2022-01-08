import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:gridlines/pak.dart';

import 'Athlete.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveAthlete(Athlete user) {
  var id = databaseReference.child('Athletes/').push();
  id.set(user.toJson());
  return id;
}

void savePurchasedPak(Athlete currentUser, Pak chosenPak) {
  var id = databaseReference
      .child('Athletes/' + currentUser.getID().key + '/Paks/')
      .push();

  id.update(chosenPak.toJson());
}

Future<void> checkForUser(String email) async {
  DataSnapshot dataSnapshot = await databaseReference.child('Athletes/').once();
  bool _found = false;

  debugPrint('Checking for user $email');
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Athlete existingUser = createAthlete(value);
      existingUser.setId(databaseReference.child('Athletes/' + key));
      if (_found == false) {
        if (existingUser.email == email) {
          _found = true;
        } else {
          debugPrint("No user exists under the email: " + email);
          Athlete newUser = new Athlete();
          newUser.setAthleteEmail(email);
          newUser.setId(saveAthlete(newUser));
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

Future<void> updateAthleteData(String email) async {
  DataSnapshot dataSnapshot = await databaseReference.child('Athletes/').once();
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Athlete existingUser = createAthlete(value);
      existingUser.setId(databaseReference.child('Athletes/' + key));

      if (existingUser.email == email) {
        existingUser.getID().update(existingUser.toJson());
      }
    });
  }
}

Future<Athlete> getAthlete(String email) async {
  DataSnapshot dataSnapshot = await databaseReference.child('Athletes/').once();
  Athlete athlete = new Athlete();
  athlete.email = "";
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Athlete existingUser = createAthlete(value);
      existingUser.setId(databaseReference.child('Athletes/' + key));

      if (existingUser.email == email) {
        athlete = existingUser;
      }
    });
  }
  return athlete;
}

Future<List<Pak>> getPlayPak() async {
  List<Pak> paks = [];
  DataSnapshot dataSnapshot =
      await databaseReference.child('Plays/plays/').once();

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((value) {
      Pak pak = new Pak();
      paks.add(pak.createPak(value));
    });
  }
  return paks;
}
