import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/Services/database.dart';
import 'package:gridlines/pak.dart';

class PlayPak extends StatefulWidget {
  Pak pak = new Pak();
  Athlete currentAthlete = new Athlete();

  PlayPak(Pak playPak, Athlete currentAthlete) {
    this.currentAthlete = currentAthlete;
    pak = playPak;
  }
  @override
  _PlayPakState createState() => _PlayPakState();
}

class _PlayPakState extends State<PlayPak> {
  @override
  Widget build(BuildContext context) {
    String pakImage = widget.pak.PlayPakPhoto1;
    debugPrint(pakImage);
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Row(
        children: <Widget>[
          Container(
            child: Image.asset('images/Pak_Images/$pakImage'),
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
                  widget.pak.PlayPakName,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                child: Text(
                  widget.pak.PlayPakPrice,
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
                  onPressed: () {
                    savePurchasedPak(widget.currentAthlete, widget.pak);
                  },
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
