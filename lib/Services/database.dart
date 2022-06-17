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

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Athlete existingUser = createAthlete(value);
      existingUser.setId(databaseReference.child('Athletes/' + key));
      if (_found == false) {
        if (existingUser.email == email) {
          _found = true;
        } else {
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

Future<void> updateAthleteData(Athlete athlete) async {
  DataSnapshot dataSnapshot = await databaseReference.child('Athletes/').once();
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Athlete existingUser = createAthlete(value);
      existingUser.setId(databaseReference.child('Athletes/' + key));

      if (existingUser.email == athlete.email) {
        debugPrint('found user to udpate');
        debugPrint(athlete.styleOfPlay + " style");
        existingUser.getID().set({
          'first': athlete.fName,
          'last': athlete.lName,
          'display_name': athlete.displayName,
          'email': athlete.email,
          'styleOfPlay': athlete.styleOfPlay
        });
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

Future<bool> isNewAthlete(String email) async {
  DataSnapshot dataSnapshot = await databaseReference.child('Athletes/').once();
  bool isNew = false;
  Athlete athlete = new Athlete();
  athlete.email = "";
  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      if (value['styleOfPlay'] == "") {
        isNew = true;
      }
    });
  }
  return isNew;
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

Future<List<Pak>> getCurrentCart(Athlete currentUser) async {
  List<Pak> paks = [];
  DataSnapshot dataSnapshot = await databaseReference
      .child('Athletes/' + currentUser.getID().key + '/Cart/')
      .once();

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
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
