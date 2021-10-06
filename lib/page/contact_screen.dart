import 'package:develiny/app_bar.dart';
import 'package:develiny/bottom_bar.dart';
import 'package:develiny/get_size.dart';
import 'package:develiny/navi_item.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

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
              ContactUsScreen(),
              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController tecName = TextEditingController();
    TextEditingController tecEmail = TextEditingController();
    TextEditingController tecContents = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Center(
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
          width: size.width * 0.7,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Contect',
                  style: TextStyle(
                      color: Color.fromRGBO(5, 5, 100, 1.0),
                      fontWeight: FontWeight.bold),
                ),
                Text("If you have any questions about my services, or just want to say hello, feel free to contact me. Below are my email: "),
                SizedBox(height: 20.0),
                TextField(
                  controller: tecName,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'Your Name',
                      hintText: 'Name'),
                  autofocus: false,
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: tecEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'Your Email',
                      hintText: 'We need your email to reply'),
                  autofocus: false,
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: tecContents,
                  keyboardType: TextInputType.multiline,
                  minLines: 12,
                  maxLines: 100,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      labelText: 'Contect',
                      hintText: 'Contents'),
                  autofocus: false,
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.send),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Send')
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      fixedSize: Size(100, 40)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
