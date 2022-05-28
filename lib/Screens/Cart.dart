import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/Custom_Widgets/PlayPak.dart';
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
    if (mounted) {
      setState(() {
        getCurrentCart(widget.currentAthlete).then((value) {
          cartPaks = value;
        });
      });
    }
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
              return CartItem(widget.currentAthlete, cartPaks.elementAt(index));
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

class CartItem extends StatefulWidget {
  Athlete currentAthlete = new Athlete();
  Pak currentPak = new Pak();

  ///
  ///Refresh cart paks on the cart screen.
  ///They aren't appearing instantly on the cart screen.
  ///
  ///
  CartItem(Athlete athlete, Pak pak) {
    currentAthlete = athlete;
    currentPak = pak;
  }
  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(widget.currentPak.PlayPakName),
          Text(widget.currentPak.PlayPakPrice)
        ],
      ),
    );
  }
}
