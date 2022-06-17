import 'package:flutter/material.dart';
import 'package:gridlines/Athlete.dart';
import 'package:gridlines/Services/database.dart';
import 'package:gridlines/pak.dart';

class CartScreen extends StatefulWidget {
  Athlete currentAthlete = new Athlete();
  static List<Pak> cartPaks = [];

  CartScreen(Athlete athlete) {
    currentAthlete = athlete;
  }
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Text('Cart'),
      SizedBox(
        height: 20,
      ),
      Text('Items in cart'),
      Expanded(
        child: FutureBuilder<List<Pak>>(
          future: getCurrentCart(widget.currentAthlete),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              debugPrint(snapshot.data!.length.toString() + " Data");
              return ListView.separated(
                  itemBuilder: (_, index) {
                    return CartItem(
                        widget.currentAthlete, snapshot.data!.elementAt(index));
                  },
                  separatorBuilder: (_, n) => Divider(
                        color: Colors.grey,
                      ),
                  cacheExtent: 500,
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data!.length);
            } else {
              return Text('Empty');
            }
            ;
          },
        ),
      ),
      TextButton(
          onPressed: () {
            savePurchasedPak(widget.currentAthlete);
            clearCart(widget.currentAthlete);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => CartScreen(widget.currentAthlete)));
          },
          child: Text('Purchase Now')),
      TextButton(
          onPressed: () {
            clearCart(widget.currentAthlete);
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => CartScreen(widget.currentAthlete)));
          },
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
