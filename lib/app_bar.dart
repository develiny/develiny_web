import 'package:develiny/get_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (isDesktop(context)) {
        return DesktopAppBar();
      } else if (isTab(context)) {
        return DesktopAppBar();
      } else if (isMobile(context)) {
        return MobileAppBar();
      } else {
        return MobileAppBar();
      }
    });
  }
}

class DesktopAppBar extends StatelessWidget {
  const DesktopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () {
                if (ModalRoute.of(context)!.settings.name != '/home') {
                  Navigator.pushNamed(context, '/home');
                }
              },
              child: Row(
                children: [
                  Image.asset(
                    'images/develinyicon.png',
                    width: 60.0,
                    height: 60.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    'Develiny',
                    style: GoogleFonts.pacifico(
                        fontSize: 30.0, color: Color.fromRGBO(5, 5, 100, 1.0)),
                  )
                ],
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    if (ModalRoute.of(context)!.settings.name != '/home') {
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                  child: Text(
                    'Home',
                    style: TextStyle(
                        color: Color.fromRGBO(5, 5, 100, 1.0),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (ModalRoute.of(context)!.settings.name != '/about_us') {
                      Navigator.pushNamed(context, '/about_us');
                    }
                  },
                  child: Text(
                    'About Us',
                    style: TextStyle(
                        color: Color.fromRGBO(5, 5, 100, 1.0),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (ModalRoute.of(context)!.settings.name != '/product') {
                      Navigator.pushNamed(context, '/product');
                    }
                  },
                  child: Text(
                    'Product',
                    style: TextStyle(
                        color: Color.fromRGBO(5, 5, 100, 1.0),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    if (ModalRoute.of(context)!.settings.name != '/contect_us') {
                      Navigator.pushNamed(context, '/contect_us');
                    }
                  },
                  child: Text(
                    'Contect Us',
                    style: TextStyle(
                        color: Color.fromRGBO(5, 5, 100, 1.0),
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MobileAppBar extends StatelessWidget {
  const MobileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isMoreSmall(BuildContext context) =>
        MediaQuery.of(context).size.width < 319;
    return Container(
      child: Padding(
          // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          padding: !isMoreSmall(context)
              ? EdgeInsets.symmetric(vertical: 20, horizontal: 40)
              : EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Opacity(
                opacity: 0.0,
                child: Icon(
                  Icons.menu,
                  size: 20.0,
                ),
              ),
              TextButton(
                onPressed: () {
                  if (ModalRoute.of(context)!.settings.name != '/home') {
                    Navigator.pushNamed(context, '/home');
                  }
                },
                child: Row(
                  children: [
                    Image.asset(
                      'images/develinyicon.png',
                      width: 35.0,
                      height: 35.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Text(
                      'Develiny',
                      style: GoogleFonts.pacifico(
                          fontSize: 30.0,
                          color: Color.fromRGBO(5, 5, 100, 1.0)),
                    )
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(Icons.menu))
            ],
          )),
    );
  }
}
