import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/pak.dart';

final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveAthlete(Athlete user) {
  var id = databaseReference.child('Athletes/').push();
  id.set(user.toJson());
  return id;
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

Future<List<Pak>> getCurrentPlayPaks() async {
  List<Pak> paks = [];
  DataSnapshot dataSnapshot = await databaseReference.child('Paks/Paks').once();

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((value) {
      Pak pak = new Pak();
      paks.add(pak.createPak(value));
    });
  }
  return paks;
}

Future<Pak> getPlayPak(String UID) async {
  Pak pak = new Pak();

  DataSnapshot dataSnapshot = await databaseReference.child('Paks/Paks').once();
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((value) {
      if (value['PlayPakUniqueID'] == UID) {
        pak = pak.createPak(value);
        debugPrint("found pak " + pak.PlayPakGroupID);
      }
    });
  }

  return pak;
}

void savePurchasedPak(Athlete currentUser, Pak chosenPak) {
  var id = databaseReference
      .child('Athletes/' + currentUser.getID().key + '/Paks/')
      .push();

  id.update(chosenPak.saveID());
}

/*future<list<plays>> displayBoughtPlays() async{

  for each pak owned in athlete
  {
    list of group ids
    add group id into list if not already in list
    find all plays with matching group ids 
    if(play.groupid == to any element in [list of group ids])
       listofboughtplays.add(play)
  }

  return listOfPlayBought;
} */
