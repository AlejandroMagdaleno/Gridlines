import 'package:flutter/material.dart';

class Pak {
  String id = '';
  String name = '';
  String type = '';
  String url = '';

  Pak createPak(record) {
    Map<String, dynamic> attributes = {
      'id': '',
      'name': '',
      'type': '',
      'url': '',
    };

    record.forEach((key, value) => {attributes[key] = value});
    Pak pak = new Pak();
    pak.id = attributes['id'];
    pak.name = attributes['name'];
    pak.type = attributes['type'];
    pak.url = attributes['url'];

    return pak;
  }
}

class PlayPak extends StatefulWidget {
  Pak pak = new Pak();
  PlayPak(Pak playPak) {
    pak = playPak;
  }
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
            widget.pak.url,
            width: 150,
            height: 150,
          ),
          SizedBox(
            width: 40,
          ),
          Flexible(
            child: Column(children: <Widget>[
              Container(
                child: Text(
                  widget.pak.name,
                ),
              ),
              Container(
                child: Text(widget.pak.type),
              ),
              Container(
                child: ElevatedButton(
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
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
