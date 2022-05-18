import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/pak.dart';
import 'package:gridlines/play.dart';

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
          newUser.setId(saveAthlete(newUser));
        }
      }
    });
  } else {
    Athlete newUser = new Athlete();
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
      debugPrint('found paks');
    });
  }
  return paks;
}

Future<List<Pak>> getCurrentCart(Athlete currentUser) async {
  List<Pak> paksInCart = [];

  DataSnapshot dataSnapshot = await databaseReference
      .child('Athletes/' + currentUser.getID().key + '/Cart/')
      .once();

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Pak pak = new Pak();
      pak = pak.createPak(value);
      paksInCart.add(pak);
    });
  }

  return paksInCart;
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

void savePurchasedPak(Athlete currentUser) async {
//  id.update(chosenPak.saveID());
  DataSnapshot dataSnapshot = await databaseReference
      .child('Athletes/' + currentUser.getID().key + '/Cart/')
      .once();
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      var id = databaseReference
          .child('Athletes/' + currentUser.getID().key + '/Paks/')
          .push();

      Pak pak = new Pak();
      pak = pak.createPak(value);
      id.update(pak.saveID());
    });
  }
}

void clearCart(Athlete currentUser) async {
  var id =
      databaseReference.child('Athletes/' + currentUser.getID().key + '/Cart/');
  debugPrint('here');

  id.remove();
}

void addPaktoCart(Athlete currentUser, Pak chosenPak) async {
  List<String> groupIDS = [];

  var id = databaseReference
      .child('Athletes/' + currentUser.getID().key + '/Cart/')
      .push();

  DataSnapshot dataSnapshot = await databaseReference
      .child('Athletes/' + currentUser.getID().key + '/Cart/')
      .once();

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      groupIDS.add(value['PlayPakGroupID']);
    });
  }

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      if (!groupIDS.contains(chosenPak.PlayPakGroupID)) {
        debugPrint('didnt find pack so added one in ');
        id.update(chosenPak.saveID());
      }
    });
  } else {
    id.update(chosenPak.saveID());
  }
}

Future<List<Play>> getAthletePlays(Athlete currentUser) async {
  List<String> groupIDS = [];
  List<Play> boughtPlays = [];

  DataSnapshot playsDataSnapshot =
      await databaseReference.child('Plays/').once();

  DataSnapshot dataSnapshot = await databaseReference
      .child('Athletes/' + currentUser.getID().key + '/Paks/')
      .once();

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      if (groupIDS.contains(value['PlayPakGroupID'])) {
        debugPrint("Group id is already in the list");
      } else {
        groupIDS.add(value['PlayPakGroupID']);
      }
    });
  }

  if (playsDataSnapshot.value != null) {
    playsDataSnapshot.value.forEach((value) {
      if (groupIDS.contains(value['PlayPakGroupID'])) {
        Play play = new Play();
        play = play.createPlay(value);
        boughtPlays.add(play);
      }
    });
  }

  return boughtPlays;
}
