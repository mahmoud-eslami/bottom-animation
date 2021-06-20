import 'dart:ui';

import 'package:bottom_animation/bottom_animation.dart';
import 'package:flutter/material.dart';

/// Bottom Navigation Widget.
class BottomAnimation extends StatefulWidget {
  // widget parameters
  final int selectedIndex;
  final List<BottomNavItem> items;
  final Color backgroundColor;
  final Color activeIconColor;
  final Color deActiveIconColor;
  final double iconSize;
  final TextStyle? textStyle;
  final ValueChanged<int> onItemSelect;
  final double barHeight;
  final double barRadius;
  final Color itemHoverColor;
  final double itemHoverColorOpacity;
  final double itemHoverBorderRadius;
  final double itemHoverWidth;
  final double itemHoverHeight;
  final int hoverAlignmentDuration;

  const BottomAnimation({
    Key? key,
    required this.selectedIndex,
    required this.items,
    required this.activeIconColor,
    required this.deActiveIconColor,
    required this.backgroundColor,
    required this.onItemSelect,
    required this.itemHoverColor,
    this.hoverAlignmentDuration = 700,
    this.iconSize = 30,
    this.textStyle,
    this.barHeight = 80,
    this.barRadius = 0,
    this.itemHoverBorderRadius = 15,
    this.itemHoverColorOpacity = .13,
    this.itemHoverHeight = 55,
    this.itemHoverWidth = 150,
  }) : super(key: key);

  @override
  _BottomAnimationState createState() => _BottomAnimationState();
}

class _BottomAnimationState extends State<BottomAnimation> {
  var textStyle;
  late List<BottomNavItem> listItems;

  double calculateContainerPosition(int index) {
    //lerp parameter
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    var listSize = widget.items.length;
    var a = 0.0;
    var b = 0.0;
    // set suitable count for calculate lerp
    if (listSize == 0) {
      a = 0.0;
      b = 0.0;
    } else if (listSize == 2) {
      a = .6;
      b = .6;
    } else if (listSize == 3) {
      a = .8;
      b = .8;
    } else if (listSize == 4) {
      a = .9;
      b = .9;
    } else {
      a = 1;
      b = 1;
    }
    // return calculated lerp
    if (isLtr)
      return lerpDouble(-a, b, index / (listSize - 1))!;
    else
      return lerpDouble(b, -a, index / (listSize - 1))!;
  }

  @override
  void initState() {
    listItems = widget.items;

    textStyle = widget.textStyle ??
        TextStyle(
          color: Colors.white,
          fontSize: 18.0,
          fontWeight: FontWeight.w300,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(
            widget.barRadius,
          ),
        ),
      ),
      width: double.infinity,
      height: widget.barHeight,
      child: Stack(
        children: <Widget>[
          AnimatedAlign(
            curve: Curves.ease,
            duration: Duration(milliseconds: widget.hoverAlignmentDuration),
            alignment: Alignment(calculateContainerPosition(widget.selectedIndex), 0),
            child: Container(
              width: widget.itemHoverWidth,
              height: widget.itemHoverHeight,
              decoration: BoxDecoration(
                color: widget.itemHoverColor.withOpacity(widget.itemHoverColorOpacity),
                borderRadius: BorderRadius.all(
                  Radius.circular(widget.itemHoverBorderRadius),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: listItems.map((item) {
                var index = listItems.indexOf(item);
                return GestureDetector(
                  onTap: () => widget.onItemSelect(index),
                  child: BarItem(
                    selected: widget.selectedIndex == index,
                    activeColor: widget.activeIconColor,
                    deActiveColor: widget.deActiveIconColor,
                    widget: item.widget,
                    iconData: item.iconData,
                    title: item.title,
                    iconSize: widget.iconSize,
                    textStyle: textStyle,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// Each item in Bottom Navigation
class BarItem extends StatefulWidget {
  final Widget? widget;
  final IconData? iconData;
  final String title;
  final bool selected;
  final Color activeColor;
  final Color deActiveColor;
  final double iconSize;
  final TextStyle textStyle;

  const BarItem({
    Key? key,
    this.widget,
    this.iconData,
    required this.title,
    required this.selected,
    required this.activeColor,
    required this.deActiveColor,
    required this.iconSize,
    required this.textStyle,
  }) : super(key: key);

  @override
  _BarItemState createState() => _BarItemState();
}

class _BarItemState extends State<BarItem> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.ease,
      width: widget.selected ? 100 : 50,
      duration: Duration(seconds: 1),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            widget.widget ??
                Icon(
                  widget.iconData,
                  color: widget.selected ? widget.activeColor : widget.deActiveColor,
                  size: widget.iconSize,
                ),
            SizedBox(
              width: 10,
            ),
            widget.selected
                ? Text(
                    widget.title,
                    style: widget.textStyle,
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
