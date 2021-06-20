import 'package:flutter/material.dart';

// bottom navigation item
class BottomNavItem {
  final String title;
  final Widget widget;
  final IconData? iconData;

  BottomNavItem({
    required this.title,
    required this.widget,
    this.iconData,
  });
}
