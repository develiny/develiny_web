import 'package:develiny/app_bar.dart';
import 'package:develiny/bottom_bar.dart';
import 'package:develiny/get_size.dart';
import 'package:develiny/navi_item.dart';
import 'package:develiny/viewpager.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawerEnableOpenDragGesture: false,
      endDrawer: ConstrainedBox(
        constraints: BoxConstraints(minWidth: 150, maxWidth: 160),
        child: NavItem(),
      ),
      drawerEnableOpenDragGesture: false,
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyAppBar(),
              (!isMobile(context) ? DesktopAbountUsScreen() : MobileAboutUsScreen()),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class DesktopAbountUsScreen extends StatelessWidget {
  const DesktopAbountUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(1, 1),
                  color: Colors.grey)
            ]),
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
        width: size.width * 0.7,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Image.asset('images/develinymainicon.png'),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text('Develiny',
                        style: GoogleFonts.pacifico(
                            fontSize: 25.0,
                            color: Color.fromRGBO(5, 5, 100, 1.0))),
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                      child: Divider(height: 50, thickness: 0.5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _launchURL('https://github.com/develiny/develiny_web');
                          },
                          child: Image.asset('images/githubicon.png',
                              width: 30, height: 30),
                        ),
                        SizedBox(width: 15),
                        InkWell(
                          onTap: () {
                            _launchURL('https://play.google.com/store/apps/dev?id=6375872941885163514');
                          },
                          child: Image.asset('images/playstoreicon.png',
                              width: 30, height: 30),
                        ),
                        SizedBox(width: 15),
                        InkWell(
                          onTap: () {},
                          child: Image.asset('images/appstoreicon.png',
                              width: 30, height: 30),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      Text(
                        'Develiny develops services for the development of customers lives as a single developer.',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String _url) async {
    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
  }
}

class MobileAboutUsScreen extends StatelessWidget {
  const MobileAboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
