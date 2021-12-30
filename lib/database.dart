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

Future<void> updateAthleteData(String email) async {
  DataSnapshot dataSnapshot = await databaseReference.child('Athletes/').once();
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Athlete existingUser = createAthlete(value);
      existingUser.setId(databaseReference.child('Athletes/' + key));

      if (existingUser.email == email) {
        existingUser.getID(existingUser).update(existingUser.toJson());
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

Future<List<String>> getPlayPakFetched() async {
  List<String> result = [];
  DataSnapshot dataSnapshot =
      await databaseReference.child('Plays/plays/').once();

  dataSnapshot.value.forEach((value) {
    result.add(value['url']);
  });

  return result;
}
