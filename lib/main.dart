import 'package:flutter/material.dart';
import 'screens/skin_market_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: Color(0xFF1B1818)),
      home: SkinMarketScreen(),
    );
  }
}
