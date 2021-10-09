import 'package:develiny/app_bar.dart';
import 'package:develiny/bottom_bar.dart';
import 'package:develiny/get_size.dart';
import 'package:develiny/navi_item.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, String? name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
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
              (!isMobile(context)
                  ? DesktopDetailScreenRelaxTour(title: args['title'],)
                  : MobileDetailScreenRelaxTour(title: args['title'],)),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class DesktopDetailScreenRelaxTour extends StatelessWidget {
  const DesktopDetailScreenRelaxTour({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Divider(
              height: 30.0,
              thickness: 0.5,
            ),
          ),
          Text(title)
        ],
      ),
    );
  }
}

class MobileDetailScreenRelaxTour extends StatelessWidget {
  const MobileDetailScreenRelaxTour({Key? key, required this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}