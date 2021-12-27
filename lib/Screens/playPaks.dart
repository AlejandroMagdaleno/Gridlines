import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gridlines/Custom_Widgets/pak.dart';

class PlayPaks_Screen extends StatefulWidget {
  const PlayPaks_Screen({Key? key}) : super(key: key);

  @override
  _PlayPaks_ScreenState createState() => _PlayPaks_ScreenState();
}

class _PlayPaks_ScreenState extends State<PlayPaks_Screen> {
  List<bool> _isSelected = [true, false, false];
  int size = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 6,
                MediaQuery.of(context).size.height / 12, 0, 0),
            child: Row(
              children: <Widget>[
                ToggleButtons(
                  borderRadius: BorderRadius.circular(10),
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text("All Paks"),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text("Offense"),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Text("Defense"),
                    )
                  ],
                  isSelected: (_isSelected),
                  onPressed: (int newIndex) {
                    setState(() {
                      for (int i = 0; i < _isSelected.length; i++) {
                        if (i == newIndex) {
                          _isSelected[i] = true;
                        } else {
                          _isSelected[i] = false;
                        }
                      }
                    });
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (_, index) =>
                    PlayPak(), // get urls, return list of urls.  size = list.length
                separatorBuilder: (_, n) => Divider(
                      height: 20,
                    ),
                cacheExtent: 500,
                scrollDirection: Axis.vertical,
                itemCount: 4),
          )
        ],
      ),
    );
  }
}
