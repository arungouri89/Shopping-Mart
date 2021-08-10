import 'package:flutter/material.dart';
import 'package:shoping/Bottom.dart';
import 'package:shoping/Check.dart';
import 'package:shoping/Dynamic/Home.dart';

import 'package:shoping/Elevated.dart';
import 'package:shoping/Elevatedicon.dart';
import 'package:shoping/FloatingActionButton.dart';
import 'package:shoping/Mohit1.dart';
import 'package:shoping/Mohit2.dart';

import 'package:shoping/SearchRecord.dart';
import 'package:shoping/Test.dart';
import 'cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home:
          //MenuCls(),
          MyHomePage(),
      //    Que23Alignment()

      //  ExElevated()
      //ExFloatingAction()
      //AllDynamicProperties()
      //E1()
      //ExCheckBox()

      //ExBotton()
      // Que24Alignment()
      // Que24Alignment()
      //Que23Alignment()
      //Que23Alignment()
    );
  }
}

class MyHomePage extends StatefulWidget {
  // final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Dish> _dishes = [];
  List<Dish> _cartList = [];

  @override
  void initState() {
    super.initState();
    _populateDishes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shoping Mall"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(
                    Icons.shopping_cart,
                    size: 36.0,
                  ),
                  if (_cartList.length > 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          _cartList.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (_cartList.isNotEmpty)
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Cart(_cartList),
                    ),
                  );
              },
            ),
          )
        ],
      ),
      // drawer: LeftDrawer(),
      body: Stack(
        children: [
          Container(height: 80, width: 550, child: Text("Ok")),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 120, 8, 8),
            child: _buildGridView(),
          ),
        ],
      ),
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2.0),
        itemCount: _dishes.length,
        itemBuilder: (context, index) {
          var item = _dishes[index];
          return Container(
              height: 15,
              width: 60,
              child: GestureDetector(
                //child: Text("Food1"),
                onTap: () {
                  setState(() {
                    if (!_cartList.contains(item))
                      _cartList.add(item);
                    else
                      _cartList.remove(item);
                  });
                },

                child: Card(
                    elevation: 4.0,
                    child: Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.center,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              item.icon,
                              color: (_cartList.contains(item))
                                  ? Colors.grey
                                  : item.color,
                              size: 50.0,
                            ),
                            Text(
                              item.name,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.subhead,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child:
                                  //Text(rates.toString()),

                                  GestureDetector(
                                child:
                                    //Text("Buy Now"),
                                    (!_cartList.contains(item))
                                        ? Icon(
                                            Icons.shopping_cart,
                                            color: Colors.green,
                                          )
                                        : Icon(
                                            Icons.remove_circle,
                                            color: Colors.red,
                                          ),
                                onTap: () {
                                  setState(() {
                                    if (!_cartList.contains(item))
                                      _cartList.add(item);
                                    else
                                      _cartList.remove(item);
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ));
        });
  }

  void _populateDishes() {
    var list = <Dish>[
      Dish(
        name: 'Item 1',
        icon: Icons.fastfood,
        color: Colors.amber,
        rates: 10,
      ),
      Dish(
        name: 'Item 2 ',
        icon: Icons.print,
        color: Colors.deepOrange,
        rates: 10,
      ),
      Dish(
        name: 'Item 3',
        icon: Icons.child_care,
        color: Colors.brown,
        rates: 10,
      ),
      Dish(
        name: 'Item 3',
        icon: Icons.child_care,
        color: Colors.brown,
        rates: 10,
      ),
      Dish(
        name: 'Item 4',
        icon: Icons.whatshot,
        color: Colors.green,
        rates: 10,
      ),
      Dish(
        name: 'Laptop without OS',
        icon: Icons.laptop,
        color: Colors.purple,
        rates: 10,
      ),
      Dish(
        name: 'Mac wihout macOS',
        icon: Icons.laptop_mac,
        color: Colors.blueGrey,
        rates: 12.5,
      ),
      Dish(
        name: 'Item 3',
        icon: Icons.child_care,
        color: Colors.brown,
        rates: 10,
      ),
      Dish(
        name: 'Item 4',
        icon: Icons.whatshot,
        color: Colors.green,
        rates: 10,
      ),
      Dish(
        name: 'Laptop without OS',
        icon: Icons.laptop,
        color: Colors.purple,
        rates: 10,
      ),
      Dish(
        name: 'Mac wihout macOS',
        icon: Icons.laptop_mac,
        color: Colors.blueGrey,
        rates: 12.5,
      ),
    ];

    setState(() {
      _dishes = list;
    });
  }
}

class Dish {
  final String name;
  final IconData icon;
  final Color color;
  final double rates;

  Dish(
      {required this.name,
      required this.icon,
      required this.color,
      required this.rates});
}
