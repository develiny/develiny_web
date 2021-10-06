import 'package:flutter/material.dart';

class NavItem extends StatelessWidget {
  const NavItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.white,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20.0),
              NavItems(title: 'Home', tapEvent: () {
                if (ModalRoute.of(context)!.settings.name != '/home') {
                  Navigator.pushNamed(context, '/home');
                }
              }),
              SizedBox(height: 20.0),
              NavItems(title: 'About Us', tapEvent: () {
                if (ModalRoute.of(context)!.settings.name != '/about_us') {
                  Navigator.pushNamed(context, '/about_us');
                }
              }),
              SizedBox(height: 20.0),
              NavItems(title: 'Product', tapEvent: () {
                if (ModalRoute.of(context)!.settings.name != '/product') {
                  Navigator.pushNamed(context, '/product');
                }
              }),
              SizedBox(height: 20.0),
              NavItems(title: 'Contect Us', tapEvent: () {
                if (ModalRoute.of(context)!.settings.name != '/contect_us') {
                  Navigator.pushNamed(context, '/contect_us');
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}

class NavItems extends StatelessWidget {
  const NavItems({Key? key, required this.title, required this.tapEvent})
      : super(key: key);

  final String title;
  final GestureTapCallback tapEvent;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapEvent,
      hoverColor: Colors.blueGrey, //transparent
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w300),
      ),
    );
  }
}
