import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SkinMarketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Skin Market'),
          centerTitle: true,
          actions: [
            FlatButton(
              onPressed: null,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFFD700), shape: BoxShape.circle),
                padding: EdgeInsets.all(7),
                child: CircleAvatar(
                  maxRadius: 10,
                  minRadius: 8,
                  backgroundImage: AssetImage('images/card2.jpg'),
                ),
              ),
            ),
            FlatButton(
              onPressed: null,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFFFD700), shape: BoxShape.circle),
                padding: EdgeInsets.all(7),
                child: CircleAvatar(
                  maxRadius: 10,
                  minRadius: 8,
                  backgroundImage: AssetImage('images/money.png'),
                ),
              ),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          color: Theme.of(context).primaryColor,
          child: GridView.builder(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              itemCount: 15,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (ctx, index) {
                return Container(
                  child: Column(children: [
                    Text(
                      'Title',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.white, Colors.black]),
                      ),
                      child: CircleAvatar(
                        radius: 70,
                        backgroundImage: AssetImage('images/kratos2.jpg'),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '\$600',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ]),
                );
              }),
        ));
  }
}

// Card(
// color: Colors.white,
// shape: CircleBorder(
// side: BorderSide(
// width: 15, color: Theme.of(context).primaryColor)),
// child: Column(
// children: [
// Text('Title',
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// color: Colors.black))
// ],
// ));

// GridTile(
// header: Center(
// child: ,
// ),
// child: Column(
// children: [
// SizedBox(height: 30),
// Container(
// height: 115,
// width: 140,
// decoration: BoxDecoration(
// shape: BoxShape.circle,
// gradient: LinearGradient(
// colors: [Colors.purple, Colors.white])),
// padding: EdgeInsets.all(10),
// child: CircleAvatar(
// backgroundImage: AssetImage('images/kratos2.jpg'),
// ),
// ),
// SizedBox(height: 30),
// ],
// ),
// // SizedBox(
// //   height: 10,
// // ),
// footer: Center(
// child: Text('\$600',
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// color: Colors.white)),
// ),
// );
