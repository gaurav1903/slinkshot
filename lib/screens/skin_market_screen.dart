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
              itemCount: 15,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1),
              itemBuilder: (ctx, index) {
                return GridTile(
                  child: Column(
                    children: [
                      Text('Title',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 110,
                        width: 110,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                                colors: [Colors.purple, Colors.white])),
                        padding: EdgeInsets.all(10),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('images/kratos2.jpg'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text('\$600',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                );
              }),
        ));
  }
}
