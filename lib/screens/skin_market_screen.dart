import 'dart:ui';
import 'package:slinkshot/model/skins.dart';
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
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Center(child: desiredtextwid('Season3')),
            SizedBox(height: 10),
            GridViewWidget(skins1),
            Center(child: desiredtextwid('Season2')),
            SizedBox(height: 10),
            GridViewWidget(skins2),
            Center(child: desiredtextwid('Season1')),
            SizedBox(height: 10),
            GridViewWidget(skins3)
          ],
        ),
      ),
    ); //todo :Add list of skins in a particular level
  }
}

class GridViewWidget extends StatelessWidget {
  final List<Skin> skins;
  GridViewWidget(this.skins);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).primaryColor,
        height: 220 * (skins.length / 2 + skins.length % 2),
        child: GridView.builder(
            physics: new NeverScrollableScrollPhysics(),
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
                  desiredtextwid(skins[index].title),
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
                  desiredtextwid('\$${skins[index].amount}'),
                ]),
              );
            }),
      ),
    );
  }
}

class desiredtextwid extends StatelessWidget {
  String s;
  desiredtextwid(this.s);

  @override
  Widget build(BuildContext context) {
    return Text(
      s,
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
