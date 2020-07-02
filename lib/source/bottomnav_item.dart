import 'package:flutter/material.dart';

// bottom navigation item
class BottomNavItem {
  final String title;
  final IconData iconData;
  final IconTheme iconTheme;

  BottomNavItem({
    @required this.title,
    @required this.iconData,
    this.iconTheme,
  });
}

// theme for each icon of items
class IconTheme {
  final double iconSize;
  final Color iconColor;

  IconTheme({
    this.iconSize,
    this.iconColor,
  });
}
