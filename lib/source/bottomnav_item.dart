import 'package:flutter/material.dart';

class BottomNavItem {
  final int index;
  final String title;
  final IconData iconData;
  final Alignment alignment;

  BottomNavItem({
    @required this.index,
    @required this.title,
    @required this.iconData,
    @required this.alignment,
  });
}
