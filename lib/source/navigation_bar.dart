import 'package:bottom_animation/bottom_animation.dart';
import 'package:flutter/material.dart';

class BottomAnimation extends StatefulWidget {
  final int selectedIndex;
  final List<BottomNavItem> items;
  final Color backgroundColor;
  final Color activeIconColor;
  final Color deactiveIconColor;
  final double iconSize;
  final TextStyle textStyle;
  final ValueChanged<int> onItemSelect;

  const BottomAnimation({
    Key key,
    @required this.selectedIndex,
    @required this.items,
    @required this.activeIconColor,
    @required this.deactiveIconColor,
    @required this.backgroundColor,
    @required this.onItemSelect,
    this.iconSize,
    this.textStyle,
  }) : super(key: key);

  @override
  _BottomAnimationState createState() => _BottomAnimationState();
}

class _BottomAnimationState extends State<BottomAnimation> {
  var iconSize;
  var textStyle;
  List<BottomNavItem> listItems;
  @override
  void initState() {
    listItems = widget.items;
    iconSize = widget.iconSize ?? 25.0;
    textStyle = widget.textStyle ??
        TextStyle(
          color: Colors.white,
          fontSize: 15.0,
          fontWeight: FontWeight.w500,
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: widget.backgroundColor,
      child: Padding(
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
                iconSize: iconSize,
                textStyle: textStyle,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class BarItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final Color activeColor;
  final Color deactiveColor;
  final double iconSize;
  final TextStyle textStyle;

  const BarItem(
      {Key key,
      this.icon,
      this.title,
      this.selected,
      this.activeColor,
      this.deactiveColor,
      this.iconSize,
      this.textStyle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: selected ? activeColor : deactiveColor,
          size: selected ? iconSize + 10 : iconSize,
        ),
        SizedBox(
          width: 10,
        ),
        selected
            ? Text(
                title,
                style: textStyle,
              )
            : Container(),
      ],
    );
  }
}
