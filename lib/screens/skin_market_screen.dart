import 'dart:developer';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:slinkshot/model/skins.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slinkshot/dataprovider/skindata.dart';
import 'dart:math' as math;

class SkinMarketScreen extends StatefulWidget {
  @override
  _SkinMarketScreenState createState() => _SkinMarketScreenState();
}

class _SkinMarketScreenState extends State<SkinMarketScreen> {
  TextEditingController _controller = TextEditingController();

  bool test(Skin a, String s) {
    for (int i = 0; i < math.min(a.title.length, s.length); i++) {
      if (s[i] != a.title[i].toLowerCase()) return false;
    }
    return true;
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller = TextEditingController();
    _controller.addListener(() {
      final text = _controller.text.toLowerCase();
      _controller.value = _controller.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setEnabledSystemUIOverlays([]);

    ///to make app fullscreen
    log('build runs');
    log(_controller.text);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'first'),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: 'second')
        ],
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('Skin Market'),
        centerTitle: true,
        actions: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(7),
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Color(0xFFFFD700), shape: BoxShape.circle),
                child: CircleAvatar(
                  maxRadius: 11,
                  backgroundImage: AssetImage('images/card2.jpg'),
                ),
              ),
              Container(
                // padding: EdgeInsets.all(7),
                padding: EdgeInsets.fromLTRB(7, 7, 7, 0),
                margin: EdgeInsets.fromLTRB(4, 4, 4, 0),
                decoration: BoxDecoration(
                    color: Color(0xFFFFD700), shape: BoxShape.circle),
                child: CircleAvatar(
                  maxRadius: 11,
                  backgroundImage: AssetImage('images/money.png'),
                ),
              ),
            ],
          )
        ],
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            Container(
                child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: 'Search',
                labelStyle: TextStyle(color: Colors.white),
              ),
              controller: _controller,
              keyboardType: TextInputType.text,
              // onSubmitted: (val) {
              //   setState(() {
              //     _controller.text = val;
              //   });
              // },
              onChanged: (val) async {
                setState(() {
                  _controller.text = val;
                });
              },
            )),
            SizedBox(height: 10),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                desiredtextwid('900 ', 25),
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFFFD700), shape: BoxShape.circle),
                  child: CircleAvatar(
                    maxRadius: 14,
                    backgroundImage: AssetImage('images/money.png'),
                  ),
                ),
              ],
            )),
            SizedBox(height: 10),
            Center(child: desiredtextwid('Owned SlinkCoin')),
            SizedBox(height: 20),
            Center(child: desiredtextwid('Season3')),
            SizedBox(height: 10),
            GridViewWidget(_controller.text == null || _controller.text.isEmpty
                ? skins1
                : skins1.where((x) {
                    return test(x, _controller.text);
                  }).toList()),
            Center(child: desiredtextwid('Season2')),
            SizedBox(height: 10),
            GridViewWidget(_controller.text == null || _controller.text.isEmpty
                ? skins2
                : skins2.where((x) {
                    return test(x, _controller.text);
                  }).toList()),
            Center(child: desiredtextwid('Season1')),
            SizedBox(height: 10),
            GridViewWidget((_controller.text == null || _controller.text.isEmpty
                ? skins3
                : skins3.where((x) {
                    return test(x, _controller.text);
                  }).toList())),
          ],
        ),
      ),
    );
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
        height: 200 * (skins.length / 2 + skins.length % 2) +
            15 * (skins.length / 2 + skins.length % 2 - 1),
        child: GridView.builder(
            physics: new NeverScrollableScrollPhysics(),
            // padding: EdgeInsets.all(10),
            scrollDirection: Axis.vertical,
            itemCount: skins.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 15,
                crossAxisSpacing: 20,
                childAspectRatio: 21 / 31),
            itemBuilder: (ctx, index) {
              return Container(
                child: Column(children: [
                  desiredtextwid(skins[index].title),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
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
  final String s;
  final double size;
  desiredtextwid(this.s, [this.size]);

  @override
  Widget build(BuildContext context) {
    return Text(
      s,
      style: TextStyle(
          fontSize: size == null ? 20 : size,
          fontWeight: FontWeight.bold,
          color: Colors.white),
    );
  }
}
