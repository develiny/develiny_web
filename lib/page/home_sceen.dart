import 'package:develiny/app_bar.dart';
import 'package:develiny/bottom_bar.dart';
import 'package:develiny/get_size.dart';
import 'package:develiny/navi_item.dart';
import 'package:develiny/viewpager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   endDrawerEnableOpenDragGesture: false,
    //   endDrawer: ConstrainedBox(
    //     constraints: BoxConstraints(minWidth: 150, maxWidth: 160),
    //     child: NavItem(),
    //   ),
    //   drawerEnableOpenDragGesture: false,
    //   body: Container(
    //     child: SingleChildScrollView(
    //       child: Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           MyAppBar(),
    //           HomeScreen(),
    //           ViewPager(),
    //           BottomBar(),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
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
              HomeScreen(),
              ViewPager(),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: !isMobile(context) ? 50.0 : 0.0),
              child: Column(
                mainAxisAlignment: !isMobile(context)
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
                crossAxisAlignment: !isMobile(context)
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
                children: [
                  if (isMobile(context))
                    Image.asset(
                      'images/develinymainicon.png',
                      height: size.height * 0.3,
                      fit: BoxFit.fill,
                    ),
                  MainText()
                ],
              ),
            ),
          ),
          if (!isMobile(context))
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
              child: Image.asset(
                'images/develinymainicon.png',
                height: size.height * 0.5,
                fit: BoxFit.fill,
              ),
            )
        ],
      ),
    );
  }
}

class MainText extends StatelessWidget {
  const MainText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: !isMobile(context)
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      crossAxisAlignment: !isMobile(context)
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Welcome to ',
                style: TextStyle(
                    fontSize: isDesktop(context) ? 64 : 32,
                    fontWeight: FontWeight.w800,
                    color: Colors.black)),
            TextSpan(
                text: 'Develiny',
                style: TextStyle(
                    fontSize: isDesktop(context) ? 64 : 32,
                    fontWeight: FontWeight.w800,
                    color: Colors.indigo))
          ]),
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Take a',
                style: TextStyle(
                    fontSize: isDesktop(context) ? 64 : 32,
                    fontWeight: FontWeight.w800, color: Colors.black)),
            TextSpan(
                text: ' look',
                style: TextStyle(
                    fontSize: isDesktop(context) ? 64 : 32,
                    fontWeight: FontWeight.w800, color: Colors.black)),
            TextSpan(
                text: ' at ',
                style: TextStyle(
                    fontSize: isDesktop(context) ? 64 : 32,
                    fontWeight: FontWeight.w800, color: Colors.black)),
            TextSpan(
                text: 'our ',
                style: TextStyle(
                    fontSize: isDesktop(context) ? 64 : 32,
                    fontWeight: FontWeight.w800, color: Colors.black)),
            TextSpan(
                text: 'product',
                style: TextStyle(
                    fontSize: isDesktop(context) ? 64 : 32,
                    fontWeight: FontWeight.w800, color: Colors.black))
          ]),
        ),
        SizedBox(
          height: 30.0,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Advertising and business ',
                style: TextStyle(
                  fontSize: isDesktop(context)
                      ? 32
                      : isTab(context)
                          ? 20
                          : 20,
                  fontWeight: FontWeight.w500, color: Colors.black
                )),
            TextSpan(
                text: 'inquiries are always welcome.',
                style: TextStyle(
                  fontSize: isDesktop(context)
                      ? 32
                      : isTab(context)
                          ? 20
                          : 20,
                  fontWeight: FontWeight.w500, color: Colors.black
                ))
          ]),
        )
      ],
    );
  }
}
