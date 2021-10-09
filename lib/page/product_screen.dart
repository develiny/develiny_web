import 'package:develiny/app_bar.dart';
import 'package:develiny/bottom_bar.dart';
import 'package:develiny/get_size.dart';
import 'package:develiny/navi_item.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({Key? key}) : super(key: key);

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
              ProductScreen(),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        width: !isMobile(context) ? size.width * 0.8 : size.width * 0.9,
        child: isDesktop(context)
            ? DesktopProductList()
            : isTab(context)
                ? TabProductList()
                : MobileProductList(),
      ),
    );
  }
}

class DesktopProductList extends StatelessWidget {
  const DesktopProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Expanded(
          child: DesktopProductItem(
            textSize: 17.0,
            title: 'Relax Tour',
            img: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.asset(
                'images/relaxtouricon.png',
                width: size.width * 0.1,
              ),
            ),
            text:
                'Are you not satisfied with your relaxation?\n\ndo you want your break time to be more efficient?\nThe solution is in this app Relax Tour',
            onPressed: () {
              PassRelaxTour.passRelaxTour(context);
            },
          ),
        ),
        SizedBox(width: 30.0),
        Expanded(
          child: DesktopProductItem(
            textSize: 15.0,
            title: '나훈아 노래모음',
            img: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.asset(
                'images/nhaicon.png',
                width: size.width * 0.1,
              ),
            ),
            text:
                '국민가수 나훈아 노래를 인기순으로 볼 수 있습니다.\n나훈아 팬분들의 연령을 감안해 최대한 간단한 조작법으로 재작되었습니다.\n나훈아의 모든 노래를 영상과 함께 무료로 감상하세요!',
            onPressed: () {
              Navigator.pushNamed(context, '/product/detail');
            },
          ),
        ),
      ],
    );
  }
}

class TabProductList extends StatelessWidget {
  const TabProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabProductItem(
          title: 'Relax Tour',
          img: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.asset(
              'images/relaxtouricon.png',
              width: 130,
            ),
          ),
          text:
              'Are you not satisfied with your relaxation?\n\ndo you want your break time to be more efficient?\nThe solution is in this app Relax Tour',
          textSize: 17.0,
        ),
        SizedBox(height: 30.0),
        TabProductItem(
          title: '나훈아 노래모음',
          img: ClipRRect(
            borderRadius: BorderRadius.circular(30.0),
            child: Image.asset(
              'images/nhaicon.png',
              width: 130,
            ),
          ),
          text:
              '국민가수 나훈아 노래를 인기순으로 볼 수 있습니다.\n\n나훈아 팬분들의 연령을 감안해 최대한 간단한 조작법으로 재작되었습니다.\n나훈아의 모든 노래를 영상과 함께 무료로 감상하세요!',
          textSize: 14.0,
        ),
      ],
    );
  }
}

class MobileProductList extends StatelessWidget {
  const MobileProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        MobileProductItem(
          img:
              Image.asset('images/relaxtouricon.png', width: size.width * 0.27),
          title: 'Relax Tour',
          text:
              'Are you not satisfied with your relaxation?\n\ndo you want your break time to be more efficient?\nThe solution is in this app Relax Tour',
          size: size,
        ),
        SizedBox(height: 20.0),
        MobileProductItem(
          img: Image.asset('images/nhaicon.png', width: size.width * 0.27),
          title: '나훈아 노래모음',
          text:
              '국민가수 나훈아 노래를 인기순으로 볼 수 있습니다.\n\n나훈아 팬분들의 연령을 감안해 최대한 간단한 조작법으로 재작되었습니다.\n나훈아의 모든 노래를 영상과 함께 무료로 감상하세요!',
          size: size,
        )
      ],
    );
  }
}

class DesktopProductItem extends StatelessWidget {
  const DesktopProductItem(
      {Key? key,
      required this.title,
      required this.img,
      required this.text,
      required this.textSize,
      required this.onPressed})
      : super(key: key);

  final String title;
  final Widget img;
  final String text;
  final double textSize;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
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
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    img,
                    Text(title,
                        style: TextStyle(
                            color: Color.fromRGBO(5, 5, 100, 1.0),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: 10.0, bottom: 10.0, top: 20.0, left: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            text,
                            style: TextStyle(fontSize: textSize),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: onPressed,
                              child: Text('VIEW MORE'),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(5, 5, 100, 1.0)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: Text('Privacy Policy'))
            ],
          )
        ],
      ),
    );
  }
}

class TabProductItem extends StatelessWidget {
  const TabProductItem(
      {Key? key,
      required this.title,
      required this.img,
      required this.text,
      required this.textSize})
      : super(key: key);

  final String title;
  final Widget img;
  final String text;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
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
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    img,
                    Text(title,
                        style: TextStyle(
                            color: Color.fromRGBO(5, 5, 100, 1.0),
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            text,
                            style: TextStyle(fontSize: textSize),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              child: Text('VIEW MORE'),
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(5, 5, 100, 1.0)),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {}, child: Text('Privacy Policy'))
            ],
          )
        ],
      ),
    );
  }
}

class MobileProductItem extends StatelessWidget {
  const MobileProductItem(
      {Key? key,
      required this.img,
      required this.title,
      required this.text,
      required this.size})
      : super(key: key);

  final Widget img;
  final String title;
  final String text;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
              color: Colors.grey)
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 10.0),
      child: Column(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(30.0), child: img),
          SizedBox(height: 10.0),
          Text(
            title,
            style: TextStyle(
                fontSize: 18.0,
                color: Color.fromRGBO(5, 5, 100, 1.0),
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          Text(
            text,
            style: TextStyle(),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {},
            child: Text('VIEW MORE'),
            style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(5, 5, 100, 1.0)),
          ),
          SizedBox(height: 20.0),
          TextButton(onPressed: () {}, child: Text('Privacy Policy'))
        ],
      ),
    );
  }
}

class PassRelaxTour {
  static void passRelaxTour(BuildContext context) {
    String title = 'relax tour';
    Navigator.pushNamed(context, '/product/detail', arguments: {'title': title});
  }
}