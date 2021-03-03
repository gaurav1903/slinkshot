import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkinMarketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('skin market page'),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          color: Color(0xFF1B1818),
          child: GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 15,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 40,
                crossAxisSpacing: 40,
                crossAxisCount: 2,
              ),
              itemBuilder: (ctx, index) {
                return GridTile(
                  header: Center(
                    child: Text('Title',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Container(
                        height: 115,
                        width: 140,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                colors: [Colors.purple, Colors.white])),
                        padding: EdgeInsets.all(10),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/kratos2.jpg'),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  footer: Center(
                    child: Text('\$600',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                );
              }),
        ));
  }
}
