import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/Services/database.dart';
import 'package:gridlines/pak.dart';

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
    getCurrentCart(widget.currentAthlete).then((value) {
      if (this.mounted) {
        setState(() {
          cartPaks = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    fillCartPaks();
    return Scaffold(
        body: Column(children: [
      Text('Cart'),
      SizedBox(
        height: 20,
      ),
      Text('Items in cart'),
      Expanded(
        child: ListView.separated(
            itemBuilder: (_, index) {
              if (cartPaks.isEmpty) {
                return Text('Cart is empty');
              } else {
                return Text("pak");
              }
            },
            separatorBuilder: (_, n) => Divider(
                  color: Colors.grey,
                ),
            cacheExtent: 500,
            scrollDirection: Axis.vertical,
            itemCount: cartPaks.length),
      ),
      TextButton(
          onPressed: () => savePurchasedPak(widget.currentAthlete),
          child: Text('Purchase Now')),
      TextButton(
          onPressed: () => clearCart(widget.currentAthlete),
          child: Text('Clear Cart')),
      TextButton(
          onPressed: () {
            Navigator.of(context, rootNavigator: true).pop('dialog');
          },
          child: Text('Back to PlayPaks')),
    ]));
  }
}
