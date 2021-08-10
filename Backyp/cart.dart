import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:shoping/Dashboard.dart';

import 'main.dart';

class Cart extends StatefulWidget {
  final List<Dish> _cart;

  Cart(this._cart);

  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0, top: 8.0),
              child: GestureDetector(
                child: Row(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 130.0),
                    //   child: Container(
                    //       child: Row(
                    //     children: [
                    //       Text("Total : " + totalrates.toString()),
                    //     ],
                    //   )),
                    // ),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_cart,
                          size: 36.0,
                        ),
                        if (_cart.length > 0)
                          Padding(
                            padding: const EdgeInsets.only(left: 2.0),
                            child: CircleAvatar(
                              radius: 8.0,
                              backgroundColor: Colors.red,
                              foregroundColor: Colors.white,
                              child: Text(
                                _cart.length.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12.0,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
                // onTap: () {
                //    if (_cart.isNotEmpty)
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (context) => null
                //         //Cart(_cartList),
                //       ),
                //     );
                // },
              ),
            ),
          ],
          title: Text('Cart'),
        ),
        body: Stack(children: [
          ListView.builder(
              itemCount: _cart.length,
              itemBuilder: (context, index) {
                var item = _cart[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  child: Card(
                    elevation: 4.0,
                    child: ListTile(
                      leading: Icon(
                        item.icon,
                        color: item.color,
                      ),
                      title: Row(
                        children: [
                          Text(item.name),

                          //Show To Price with item//
                          // Text(" : Price is " + item.rates.toString()),
                        ],
                      ),
                      trailing: GestureDetector(
                          child: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                          ),
                          onTap: () {
                            setState(() {
                              _cart.remove(item);
                            });
                          }),
                    ),
                  ),
                );
              }),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey[900],
                      border: Border.all(),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      // shape: BoxShape.circle,
                    ),
                    // decoration: BoxDecoration(
                    //   borderRadius: BorderRadius.all(Radius.circular(10)),
                    //   color: Colors.blueGrey[900],
                    // ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //..................To Show Total Here..............//
                          // Text(
                          //   "Total : " + totalrates.toString(),
                          //   style: TextStyle(
                          //     fontSize: 15,
                          //     color: Colors.white,
                          //   ),
                          // ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartDetails(_cart)),
                                );
                              },
                              child: Text(
                                "view cart",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      ),
                    )),
              ))
        ]));
  }
}
