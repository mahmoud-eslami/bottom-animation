import 'package:flutter/material.dart';

// bottom navigation item
class BottomNavItem {
  final String title;
  final Widget widget;
  final IconData iconData;

  BottomNavItem({
    @required this.title,
    this.widget,
    this.iconData,
  }) : assert(widget != null || iconData != null);
}
