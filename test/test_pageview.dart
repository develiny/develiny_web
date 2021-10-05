import 'package:develiny/get_size.dart';
import 'package:flutter/material.dart';

import 'package:scroll_page_view/pager/page_controller.dart';
import 'package:scroll_page_view/pager/scroll_page_view.dart';
import 'package:scroll_page_view/scroll_page.dart';

class ViewPager extends StatefulWidget {
  const ViewPager({Key? key}) : super(key: key);

  @override
  _ViewPagerState createState() => _ViewPagerState();
}

class _ViewPagerState extends State<ViewPager> {
  @override
  Widget build(BuildContext context) {
    return (!isMobile(context) ? DesktopViewPager() : MobileViewPager());
  }
}

class DesktopViewPager extends StatefulWidget {
  const DesktopViewPager({Key? key}) : super(key: key);

  @override
  State<DesktopViewPager> createState() => _DesktopViewPagerState();
}

class _DesktopViewPagerState extends State<DesktopViewPager> {
  @override
  Widget build(BuildContext context) {
    final PageController pageController =
    PageController(initialPage: 1, keepPage: true);
    return Container(
      width: double.infinity,
      height: 350,
      color: Colors.grey,
      child: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: [
          Image.asset(
            'images/aaa.png',
            width: 300,
            height: 500,
          ),
          Image.asset(
            'images/bbb.png',
            width: 300,
            height: 500,
          ),
          Image.asset(
            'images/ccc.png',
            width: 300,
            height: 500,
          ),
        ],
      ),
    );
  }
}

class MobileViewPager extends StatelessWidget {
  const MobileViewPager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.grey,
    );
  }
}
