import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';

class MyPlays extends StatefulWidget {
  Athlete currentAthlete = new Athlete();
  MyPlays(Athlete athlete) {
    currentAthlete = athlete;
  }
  @override
  _MyPlaysState createState() => _MyPlaysState();
}

class _MyPlaysState extends State<MyPlays> {
  List<bool> _selections = List.generate(3, (index) => false);
  @override
  Widget build(BuildContext context) {
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
              child: ListView.separated(
                  itemBuilder: (_, index) => Text('pak'),
                  separatorBuilder: (_, n) => Divider(
                        color: Colors.grey,
                      ),
                  itemCount: 3))
        ],
      ),
    );
  }
}
