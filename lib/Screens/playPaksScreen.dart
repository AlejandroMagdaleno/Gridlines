import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/Custom_Widgets/PlayPak.dart';
import 'package:gridlines/Screens/Cart.dart';
import 'package:gridlines/Services/database.dart';
import 'package:gridlines/pak.dart';

class PlayPaks_Screen extends StatefulWidget {
  List<Pak> paks = [];
  Athlete currentAthlete = new Athlete();
  PlayPaks_Screen(List<Pak> currentPaks, Athlete a) {
    paks = currentPaks;
    currentAthlete = a;
  }

  @override
  _PlayPaks_ScreenState createState() => _PlayPaks_ScreenState();
}

class _PlayPaks_ScreenState extends State<PlayPaks_Screen> {
  int size = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          // Container(
          //   child: Image.asset('images/grid.png'),
          //   height: 150,
          // ),
          SizedBox(
            height: 50,
          ),
          Text(
            "Current Paks",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (_, index) => PlayPak(
                    widget.paks.elementAt(index), widget.currentAthlete),
                separatorBuilder: (_, n) => Divider(
                      color: Colors.grey,
                    ),
                cacheExtent: 500,
                scrollDirection: Axis.vertical,
                itemCount: widget.paks.length),
          ),
          Divider(
            height: 10,
            color: Colors.black,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CartScreen(widget.currentAthlete)));
              },
              child: Text(
                'Open Cart',
                style: TextStyle(fontSize: 16),
              )),
        ],
      ),
    );
  }
}
