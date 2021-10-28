import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PlayPaks_Screen extends StatefulWidget {
  const PlayPaks_Screen({Key? key}) : super(key: key);

  @override
  _PlayPaks_ScreenState createState() => _PlayPaks_ScreenState();
}

class _PlayPaks_ScreenState extends State<PlayPaks_Screen> {
  List<bool> _isSelected = [true, false, false];

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
                itemBuilder: (_, index) => Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            'https://media.istockphoto.com/vectors/football-play-coaching-diagram-vector-id1199879553?k=20&m=1199879553&s=612x612&w=0&h=CDCkOY-OqfNzAkrYNCcp0dwZK4RQUhVlAmAWTrYZ9Eo='),
                      )),
                    ),
                separatorBuilder: (_, n) => Divider(
                      height: 20,
                    ),
                scrollDirection: Axis.vertical,
                itemCount: 20),
          )
        ],
      ),
    );
  }
}
