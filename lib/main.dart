import 'package:develiny/page/about_us_screen.dart';
import 'package:develiny/page/contact_us_screen.dart';
import 'package:develiny/page/home_sceen.dart';
import 'package:develiny/page/product_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyDevWeb());
}

class MyDevWeb extends StatelessWidget {
  const MyDevWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'develiny',
      theme: ThemeData(primaryColor: Colors.indigo),
      // home: HomePage(),
      initialRoute: "/home",
      routes: {
        "/home": (context) => HomePage(),
        "/about_us": (context) => AboutUs(),
        "/product": (context) => Product(),
        "/contect_us": (context) => ContactUs()
      },
    );
  }
}
