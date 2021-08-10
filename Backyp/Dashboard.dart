import 'package:flutter/material.dart';

import 'main.dart';

class CartDetails extends StatefulWidget {
  final List<Dish> _cart;

  CartDetails(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<CartDetails> {
  _CartState(this._cart);

  List<Dish> _cart;
  double discount = 2;

  double get totalrates {
    return _cart.fold(0.0, (rates, Dish nextProduct) {
      return rates + nextProduct.rates;

      //  return products.fold(0.0, (double currentTotal, Product nextProduct) {
      // return currentTotal + nextProduct.cost;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Cart'),
      ),
      body: Column(
        children: [
          Card(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        SizedBox(height: 100),
                        Column(
                          children: [
                            Text(
                              "Purchased Items",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            if (_cart.length > 0)
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: CircleAvatar(
                                  radius: 22.0,
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  child: Text(
                                    _cart.length.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                        Spacer(
                          flex: 1,
                        ),
                        Column(
                          children: [
                            Text(
                              "Total Amount To Pay",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,
                              ),
                            ),
                            if (_cart.length > 0)
                              Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: CircleAvatar(
                                  radius: 22.0,
                                  backgroundColor: Colors.red,
                                  foregroundColor: Colors.white,
                                  child: Text(
                                    totalrates.toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              height: 200,
              width: 500,
              decoration: BoxDecoration(
                  //color: Colors.blueGrey[200],
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
        ],
      ),
    );
  }
}
