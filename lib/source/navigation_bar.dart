import 'package:bottom_animation/bottom_animation.dart';
import 'package:flutter/material.dart';

class BottomAnimation extends StatefulWidget {
  final List<BottomNavItem> items;

  const BottomAnimation({Key key, @required this.items}) : super(key: key);

  @override
  _BottomAnimationState createState() => _BottomAnimationState();
}

class _BottomAnimationState extends State<BottomAnimation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      color: Colors.indigo,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _barItem(
                icon: widget.items[0].iconData,
                selected: true,
                title: widget.items[0].title),
            _barItem(
                icon: widget.items[1].iconData,
                selected: false,
                title: widget.items[1].title),
            _barItem(
                icon: widget.items[2].iconData,
                selected: false,
                title: widget.items[2].title),
          ],
        ),
      ),
    );
  }
}

Widget _barItem({IconData icon, String title, bool selected}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Icon(icon),
      SizedBox(
        width: 10,
      ),
      selected ? Text(title) : Container(),
    ],
  );
}
