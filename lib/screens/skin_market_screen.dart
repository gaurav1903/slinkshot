import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slinkshot/dataprovider/skindata.dart';

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
          )
        ],
      ),
      body: GridViewWidget(), //todo :Add list of skins in a particular level
    );
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Theme.of(context).primaryColor,
      child: GridView.builder(
          padding: EdgeInsets.all(10),
          scrollDirection: Axis.vertical,
          itemCount: skins.length,
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
                  skins[index].title,
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
                        colors: [skins[index].color1, skins[index].color2]),
                  ),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(skins[index].imagepath),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  '\$${skins[index].amount}',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                )
              ]),
            );
          }),
    );
  }
}
