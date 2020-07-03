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
    this.iconSize = 25,
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
                iconSize: widget.iconSize,
                textStyle: textStyle,
              ),
            );
          }).toList(),
        ),
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
  _BarItemState createState() => _BarItemState();
}

class _BarItemState extends State<BarItem> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _scaleTransitionAnimation;
  Animation<Alignment> _alignmentIconAnimation;
  Animation<Alignment> _alignmentTitleAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..forward();

    _scaleTransitionAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.ease,
        ),
        parent: _animationController,
      ),
    );
    _alignmentTitleAnimation = Tween<Alignment>(
      begin: Alignment(0, 4),
      end: Alignment(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.0,
          1.0,
          curve: Curves.ease,
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:
            widget.selected ? Colors.white.withOpacity(.1) : Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScaleTransition(
              scale: _scaleTransitionAnimation,
              child: Icon(
                widget.icon,
                color:
                    widget.selected ? widget.activeColor : widget.deactiveColor,
                size: widget.selected ? widget.iconSize + 10 : widget.iconSize,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            widget.selected
                ? AlignTransition(
                    alignment: _alignmentTitleAnimation,
                    child: Text(
                      widget.title,
                      style: widget.textStyle,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
