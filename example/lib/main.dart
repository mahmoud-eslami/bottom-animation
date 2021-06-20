import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:bottom_animation/bottom_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var items = <BottomNavItem>[
    BottomNavItem(
        title: 'logo',
        widget: Image.asset(
          'assets/images/logo.png',
          width: 30,
        )),
    BottomNavItem(
        title: 'profile',
        widget: Image.asset('assets/images/profilen.png', width: 30)),
    BottomNavItem(
        title: 'star',
        widget: Image.asset('assets/images/star.png', width: 30)),
  ];

  var cIndex;
  @override
  void initState() {
    cIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'example',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomAnimation(
          selectedIndex: cIndex,
          items: items,
          backgroundColor: Color(0xffea8c55),
          onItemSelect: (value) {
            setState(() {
              cIndex = value;
            });
          },
          itemHoverColor: Color(0xfff5dd90),
          itemHoverColorOpacity: .5,
          activeIconColor: Colors.black,
          deActiveIconColor: Colors.black38,
          barRadius: 30,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          itemHoverWidth: 135,
          itemHoverBorderRadius: 30,
        ),
      ),
    );
  }
}
