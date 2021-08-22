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

Future<Athlete> checkForUser(String email) async {
  DataSnapshot dataSnapshot = await databaseReference.child('Athletes/').once();
  Athlete newAthlete = new Athlete();

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Athlete existingUser = createAthlete(value);
      existingUser.setId(databaseReference.child('Athletes/' + key));
      debugPrint(existingUser.email! + " , " + email);
      if (existingUser.email == email) {
        debugPrint(existingUser.email);
        debugPrint("that shit do be existing -o_o-");
      } else {
        debugPrint("that shit doesn't exist");
        debugPrint(existingUser.email);
      }
    });
  }

  // If we make it here, we found no athlete with existing email
  return newAthlete;
}
