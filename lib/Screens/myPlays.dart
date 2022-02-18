import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/Custom_Widgets/PlayWidget.dart';
import 'package:gridlines/Services/database.dart';
import 'package:gridlines/play.dart';

class MyPlays extends StatefulWidget {
  Athlete currentAthlete = new Athlete();
  MyPlays(Athlete athlete) {
    currentAthlete = athlete;
  }
  @override
  _MyPlaysState createState() => _MyPlaysState();
}

class _MyPlaysState extends State<MyPlays> {
  List<Play> boughtPlays = [];
  List<bool> _selections = List.generate(3, (index) => false);
  void fillBoughtPlays() {
    getAthletePlays(widget.currentAthlete).then((value) {
      setState(() {
        boughtPlays = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    fillBoughtPlays();
    return Container(
      child: Column(
        children: [
          Text('My plays'),
          SizedBox(height: 50),
          ToggleButtons(
            children: [
              Container(
                alignment: Alignment.center,
                child: Text('All'),
                width: 100,
              ),
              Container(
                alignment: Alignment.center,
                child: Text('Offense'),
                width: 100,
              ),
              Container(
                alignment: Alignment.center,
                child: Text('Defense'),
                width: 100,
              )
            ],
            isSelected: _selections,
            borderRadius: BorderRadius.circular(20),
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < _selections.length; i++) {
                  if (i == index) {
                    _selections[i] = !_selections[i];
                  } else {
                    _selections[i] = false;
                  }
                }
              });
            },
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: boughtPlays.length,
                itemBuilder: (BuildContext context, int index) =>
                    PlayWidget(boughtPlays.elementAt(index))),
          )
        ],
      ),
    );
  }
}
