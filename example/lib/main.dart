import 'package:flutter/material.dart';
import 'package:bottom_animation/bottom_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var items = <BottomNavItem>[
    BottomNavItem(title: 'Home', iconData: Icons.home),
    BottomNavItem(title: 'Profile', iconData: Icons.portrait),
    BottomNavItem(title: 'Setting', iconData: Icons.search),
  ];
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        bottomNavigationBar: BottomAnimation(
          items: items,
        ),
      ),
    );
  }
}
