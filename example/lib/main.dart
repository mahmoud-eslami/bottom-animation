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
    BottomNavItem(title: 'Home', iconData: Icons.home),
    BottomNavItem(title: 'Profile', iconData: Icons.account_circle),
    BottomNavItem(title: 'Search', iconData: Icons.search),
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
          backgroundColor: Colors.cyan,
          onItemSelect: (value) {
            setState(() {
              cIndex = value;
            });
          },
          itemHoverColor: Colors.white,
          itemHoverColorOpacity: .2,
          activeIconColor: Colors.black,
          deactiveIconColor: Colors.black38,
          barRadius: 20,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          itemHoverWidth: 135,
          itemHoverBorderRadius: 20,
        ),
      ),
    );
  }
}
