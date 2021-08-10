import 'package:flutter/material.dart';

class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
   List _dishes = [];
  List _cartList = [];


  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 1, children: [
      Container(
        height: 15,
        width: 500,
        child: ListView(scrollDirection: Axis.horizontal, children: [
          
         
          // Container(height: 15,width: 60, child: Card(child:  GestureDetector(
          //               child: Text("Food1"),
          //               onTap: () {
          //                 setState(() {
          //                   if (!_cartList.contains(item))
          //                     _cartList.add(item);
          //                   else
          //                     _cartList.remove(item);
          //                 });
          //               },
          //             ),)),
          //    Container(height: 15,width: 60, child: Card(child: Text("Food1"),)),
          //      Container(height: 15,width: 60, child: Card(child: Text("Food1"),)),
          //        Container(height: 15,width: 60, child: Card(child: Text("Food1"),)),
          //          Container(height: 15,width: 60, child: Card(child: Text("Food1"),)),
          //            Container(height: 15,width: 60, child: Card(child: Text("Food1"),)),
          //              Container(height: 15,width: 60, child: Card(child: Text("Food1"),)),
          //                Container(height: 15,width: 60, child: Card(child: Text("Food1"),)),
          //                  Container(height: 15,width: 60, child: Card(child: Text("Food1"),)),
          //                    Container(height: 15,width: 60, child: Card(child: Text("Food1"),)),
          //                      Container(height: 15,width: 60, child: Card(child: Text("Food1"),)),
          //                        Container(height: 15,width: 60, child: Card(child: Text("Food1"),)),
                 ]),
      ),
    ]);
  }
}
