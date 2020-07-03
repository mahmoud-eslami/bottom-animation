import 'dart:ui';

import 'package:bottom_animation/bottom_animation.dart';
import 'package:flutter/material.dart';

/// Bottom Navigation Widget.
class BottomAnimation extends StatefulWidget {
  final int selectedIndex;
  final List<BottomNavItem> items;
  final Color backgroundColor;
  final Color activeIconColor;
  final Color deactiveIconColor;
  final double iconSize;
  final TextStyle textStyle;
  final ValueChanged<int> onItemSelect;
  final double barHeight;
  final double barRadius;

  const BottomAnimation({
    Key key,
    @required this.selectedIndex,
    @required this.items,
    @required this.activeIconColor,
    @required this.deactiveIconColor,
    @required this.backgroundColor,
    @required this.onItemSelect,
    this.iconSize = 30,
    this.textStyle,
    this.barHeight = 80,
    this.barRadius = 0,
  }) : super(key: key);

  @override
  _BottomAnimationState createState() => _BottomAnimationState();
}

class _BottomAnimationState extends State<BottomAnimation> {
  var textStyle;
  List<BottomNavItem> listItems;

  double calcuteContainerPosition(int index) {
    //lerp paramter
    var isLtr = Directionality.of(context) == TextDirection.ltr;
    var listSize = widget.items.length;
    var a = 0.0;
    var b = 0.0;
    // set sutable count for calcute lerp
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
    // return calcuted lerp
    if (isLtr)
      return lerpDouble(-a, b, index / (listSize - 1));
    else
      return lerpDouble(b, -a, index / (listSize - 1));
  }

  @override
  void initState() {
    listItems = widget.items;

    textStyle = widget.textStyle ??
        TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w500,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.selectedIndex);
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
            curve: Curves.linearToEaseOut,
            duration: Duration(milliseconds: 600),
            alignment:
                Alignment(calcuteContainerPosition(widget.selectedIndex), 0),
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.13),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
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
                    deactiveColor: widget.deactiveIconColor,
                    icon: item.iconData,
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
  final IconData icon;
  final String title;
  final bool selected;
  final Color activeColor;
  final Color deactiveColor;
  final double iconSize;
  final TextStyle textStyle;

  const BarItem({
    Key key,
    this.icon,
    this.title,
    this.selected,
    this.activeColor,
    this.deactiveColor,
    this.iconSize,
    this.textStyle,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          widget.icon,
          color: widget.selected ? widget.activeColor : widget.deactiveColor,
          size: widget.selected ? widget.iconSize + 10 : widget.iconSize,
        ),
        SizedBox(
          width: 10,
        ),
        widget.selected
            ? AnimatedAlign(
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
                alignment: Alignment(2, 0),
                child: Text(
                  widget.title,
                  style: widget.textStyle,
                ),
              )
            : Container(),
      ],
    );
  }
}
