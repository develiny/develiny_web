import 'package:develiny/page/about_screen.dart';
import 'package:develiny/page/contact_screen.dart';
import 'package:develiny/page/detail_screen.dart';
import 'package:develiny/page/home_sceen.dart';
import 'package:develiny/page/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(MyDevWeb());
}

class MyDevWeb extends StatelessWidget {
  const MyDevWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'develiny',
      theme: ThemeData(primaryColor: Colors.indigo),
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomePage(),
        "/about": (context) => AboutUs(),
        "/product": (context) => Product(),
        "/contect": (context) => ContactUs(),
        "/product/detail": (context) => DetailScreen()
      },
    );
  }
}
