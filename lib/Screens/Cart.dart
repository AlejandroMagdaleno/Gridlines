import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/Custom_Widgets/PlayPak.dart';
import 'package:gridlines/Services/database.dart';
import 'package:gridlines/pak.dart';
import 'package:gridlines/play.dart';

class CartScreen extends StatefulWidget {
  Athlete currentAthlete = new Athlete();
  CartScreen(Athlete athlete) {
    currentAthlete = athlete;
  }
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Pak> cartPaks = [];
  void fillCartPaks() {
    displayCurrentCart(widget.currentAthlete).then((value) => cartPaks = value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Text('Cart'),
      SizedBox(
        height: 20,
      ),
      TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
          child: Text('Back to PlayPaks')),
      TextButton(
          onPressed: () => clearCart(widget.currentAthlete),
          child: Text('Clear Cart')),
      Expanded(
        child: ListView.separated(
            itemBuilder: (_, index) =>
                PlayPak(cartPaks.elementAt(index), widget.currentAthlete),
            separatorBuilder: (_, n) => Divider(
                  color: Colors.grey,
                ),
            cacheExtent: 500,
            scrollDirection: Axis.vertical,
            itemCount: 10),
      ),
      TextButton(
          onPressed: () => savePurchasedPak(widget.currentAthlete),
          child: Text('Purchase Now')),
    ]));
  }
}
