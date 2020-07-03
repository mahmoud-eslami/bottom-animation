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
    BottomNavItem(title: 'Home', iconData: CupertinoIcons.heart),
    BottomNavItem(title: 'Profile', iconData: CupertinoIcons.person),
    BottomNavItem(title: 'Setting', iconData: CupertinoIcons.search),
    BottomNavItem(title: 'tools', iconData: CupertinoIcons.bluetooth),
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
          backgroundColor: Colors.blueGrey,
          onItemSelect: (value) {
            setState(() {
              cIndex = value;
            });
          },
          itemHoverColor: Colors.white,
          itemHoverColorOpacity: .9,
          activeIconColor: Colors.blueGrey,
          deactiveIconColor: Colors.white.withOpacity(.9),
          barRadius: 40,
          textStyle: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
          ),
          itemHoverWidth: 130,
          itemHoverBorderRadius: 40,
        ),
      ),
    );
  }
}
