import 'package:flutter/material.dart';
import 'package:bottom_animation/bottom_animation.dart';
import 'package:ionicons/ionicons.dart';

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
      widget: Icon(
        Ionicons.logo_alipay,
        color: Colors.white,
      ),
    ),
    BottomNavItem(
      title: 'profile',
      widget: Icon(
        Ionicons.at_circle_outline,
        color: Colors.white,
      ),
    ),
    BottomNavItem(
      title: 'star',
      widget: Icon(
        Ionicons.star,
        color: Colors.white,
      ),
    ),
    BottomNavItem(
      title: 'star',
      widget: Icon(
        Ionicons.star,
        color: Colors.white,
      ),
    ),
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
          isFloating: true,
          selectedIndex: cIndex,
          items: items,
          backgroundColor: Color.fromARGB(255, 196, 134, 207),
          onItemSelect: (value) {
            setState(() {
              cIndex = value;
            });
          },
          itemHoverColor: Color.fromARGB(255, 105, 6, 100),
          itemHoverColorOpacity: .5,
          activeIconColor: Colors.black,
          deActiveIconColor: Colors.black38,
          barRadius: 30,
          customBorderRadius: BorderRadius.circular(40),
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          itemHoverWidth: 110,
          itemHoverBorderRadius: 30,
        ),
      ),
    );
  }
}
