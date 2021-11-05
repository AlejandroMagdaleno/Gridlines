import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

Future<String> getURL(int index, List<bool> filter) async {
  var url;
  if (filter.elementAt(1) == true) {
    // 1 = offense
    var offense =
        await FirebaseStorage.instance.ref().child("Plays/Offense/").listAll();
    url = offense.items.elementAt(index).getDownloadURL();
  } else if (filter.elementAt(2) == true) {
    var defense =
        await FirebaseStorage.instance.ref().child("Plays/Defense/").listAll();
    url = defense.items.elementAt(index).getDownloadURL();
  }
  return url;
}

class getImage extends StatefulWidget {
  int _index = 0;
  List<bool> _filter = [true, false, false];
  getImage(int index, List<bool> filter) {
    this._index = index;
    this._filter = filter;
  }
  @override
  _getImageState createState() => _getImageState();
}

class _getImageState extends State<getImage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getURL(widget._index, widget._filter),
      builder: (context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Image.network(snapshot.data!);
        } else {
          return Container();
        }
      },
    );
  }
}
