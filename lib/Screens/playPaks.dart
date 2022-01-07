import 'package:flutter/material.dart';
import 'package:gridlines/Custom_Widgets/PlayPak.dart';
import 'package:gridlines/pak.dart';

class PlayPaks_Screen extends StatefulWidget {
  List<Pak> paks = [];
  PlayPaks_Screen(List<Pak> currentPaks) {
    paks = currentPaks;
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
          Container(
            child: Image.asset('images/grid.png'),
            height: 150,
          ),
          Text(
            "Current Paks",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Container(
            child: Row(
              children: <Widget>[],
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (_, index) =>
                    PlayPak(widget.paks.elementAt(index)),
                separatorBuilder: (_, n) => Divider(
                      color: Colors.grey,
                    ),
                cacheExtent: 500,
                scrollDirection: Axis.vertical,
                itemCount: widget.paks.length),
          )
        ],
      ),
    );
  }
}
