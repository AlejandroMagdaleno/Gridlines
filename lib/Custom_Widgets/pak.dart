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
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.network(
              widget.pak.url,
              width: 150,
              height: 150,
            ),
          ),
          SizedBox(
            width: 40,
          ),
          Flexible(
            child: Column(children: <Widget>[
              Container(
                child: Text(
                  widget.pak.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                child: Text(
                  widget.pak.type,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.green[450]),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)))),
                  onPressed: () {},
                  child: Padding(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Text(
                      "Add to cart",
                      style: TextStyle(
                          fontSize: 15,
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
