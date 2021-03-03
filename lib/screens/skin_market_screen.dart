import 'package:flutter/material.dart';

class SkinMarketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('skin market page'),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          color: Colors.black,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
              itemBuilder: (ctx, index) {
                return GridTile(
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [Colors.purple, Colors.deepPurpleAccent])),
                    padding: EdgeInsets.all(10),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('images/kratos2.jpg'),
                    ),
                  ),
                );
              }),
        ));
  }
}
