import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/pak.dart';
import 'package:gridlines/Screens/dashboard.dart';
import 'package:gridlines/Screens/myPlays.dart';
import 'package:gridlines/Screens/myTeams.dart';
import 'package:gridlines/Screens/playPaksScreen.dart';

class HomeScreen extends StatefulWidget {
  Athlete user = new Athlete();
  List<Pak> paks = [];

  HomeScreen(Athlete athlete, List<Pak> currentPaks) {
    this.user = athlete;
    paks = currentPaks;

    debugPrint(user.lName);
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = <Widget>[
      Dashboard(widget.user),
      MyTeams(),
      PlayPaks_Screen(widget.paks, widget.user),
      MyPlays(widget.user),
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
