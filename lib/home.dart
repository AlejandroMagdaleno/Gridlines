import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/dashboard.dart';

class HomeScreen extends StatefulWidget {
  Athlete? athlete;
  HomeScreen(Athlete athlete) {
    this.athlete = athlete;
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      Dashboard(),
      Icon(
        Icons.group,
        size: 150,
      ),
      Icon(
        Icons.grid_3x3,
        size: 150,
      ),
      Icon(
        Icons.phone_android_rounded,
        size: 150,
      ),
      Icon(
        Icons.book_rounded,
        size: 150,
      ),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'My Teams'),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_3x3), label: 'Play Paks'),
          BottomNavigationBarItem(
              icon: Icon(Icons.phone_android_outlined), label: 'My Plays'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined), label: 'Playbooks')
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
