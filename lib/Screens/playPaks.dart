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
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width / 6,
                MediaQuery.of(context).size.height / 12, 0, 0),
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
                      height: 20,
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
