import 'package:flutter/material.dart';
import 'package:gridlines/Custom_Widgets/pak.dart';

class PlayPaks_Screen extends StatefulWidget {
  List<String> pakUrls = [];
  PlayPaks_Screen(List<String> urls) {
    pakUrls = urls;
  }

  @override
  _PlayPaks_ScreenState createState() => _PlayPaks_ScreenState();
}

class _PlayPaks_ScreenState extends State<PlayPaks_Screen> {
  int size = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
            child: Text(
              "Current plays",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
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
                    PlayPak(widget.pakUrls.elementAt(index)),
                separatorBuilder: (_, n) => Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                cacheExtent: 500,
                scrollDirection: Axis.vertical,
                itemCount: widget.pakUrls.length),
          )
        ],
      ),
    );
  }
}
