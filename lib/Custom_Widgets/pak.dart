import 'package:flutter/material.dart';

class PlayPak extends StatefulWidget {
  const PlayPak({Key? key}) : super(key: key);

  @override
  _PlayPakState createState() => _PlayPakState();
}

class _PlayPakState extends State<PlayPak> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Image.network(
            'https://media.istockphoto.com/vectors/american-football-touchdown-strategy-diagram-on-chalkboard-vector-id473089568?k=20&m=473089568&s=612x612&w=0&h=IRyT3yd2LBmwxalHZC7jvqKd0z31hlJti29DOMvMqqg=',
            colorBlendMode: BlendMode.softLight,
            height: MediaQuery.of(context).size.width / 2,
            width: MediaQuery.of(context).size.width / 2,
          ),
          SizedBox(
            width: 40,
          ),
          Flexible(
            child: Column(children: <Widget>[
              Container(
                child: Text(
                  'Play pak 1',
                ),
              ),
              Container(
                child: Text(
                    'Lorem Ipsum issince the 1500s, when an unng Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum'),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)))),
                onPressed: () {},
                child: Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    "Buy now",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
