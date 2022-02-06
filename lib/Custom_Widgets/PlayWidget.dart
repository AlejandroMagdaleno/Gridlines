import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/play.dart';

class PlayWidget extends StatefulWidget {
  Play play = new Play();
  PlayWidget(Play play) {
    this.play = play;
  }
  @override
  _PlayWidgetState createState() => _PlayWidgetState();
}

class _PlayWidgetState extends State<PlayWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.play.PlayPakGroupID),
    );
  }
}
