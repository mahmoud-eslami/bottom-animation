import 'package:flutter/material.dart';
import 'package:bottom_animation/bottom_animation.dart';

class BottomAnimation extends StatefulWidget {
  const BottomAnimation({Key? key}) : super(key: key);

  @override
  _BottomAnimationState createState() => _BottomAnimationState();
}

class _BottomAnimationState extends State<BottomAnimation> {
  late List<GlobalKey> iconKeys;
  bool showFloating = false;
  int selectedItem = 0;
  List<WidgetInfoModel> widgetsInfo = [];
  Orientation? currentOrientation;

  @override
  void initState() {
    super.initState();
    iconKeys = List.generate(6, (_) => GlobalKey());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      calculateIconPositionsAndSizes();
    });
  }

  @override
  void didChangeDependencies() {
    if (currentOrientation == null)
      currentOrientation = MediaQuery.of(context).orientation;

    super.didChangeDependencies();
  }

  void calculateIconPositionsAndSizes() {
    widgetsInfo.clear();
    for (var i = 0; i < iconKeys.length; i++) {
      final RenderBox iconBox =
          iconKeys[i].currentContext!.findRenderObject() as RenderBox;
      final Offset iconPosition = iconBox.localToGlobal(Offset.zero);

      final RenderBox widgetBox =
          iconKeys[i].currentContext!.findRenderObject() as RenderBox;
      widgetsInfo.add(
        WidgetInfoModel(
          height: widgetBox.size.height,
          width: widgetBox.size.width,
          xDistance: iconPosition.dx,
          yDistance: iconPosition.dy,
        ),
      );
    }
    setState(() {
      showFloating = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var barBgSize = 80.0;
    var floatingIconHeight = 50.0;
    var floatingButtonHorizontalPadding = 40.0;

    return OrientationBuilder(builder: (context, orientation) {
      print(orientation);
      print(currentOrientation);
      if (orientation != currentOrientation) {
        currentOrientation = orientation;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          calculateIconPositionsAndSizes();
        });
        print(widgetsInfo);
      }

      return Container(
        color: Colors.blue,
        child: Stack(
          children: [
            if (showFloating)
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                top: (barBgSize - floatingIconHeight) / 2,
                width: widgetsInfo[selectedItem].width +
                    floatingButtonHorizontalPadding,
                height: floatingIconHeight,
                left: widgetsInfo[selectedItem].xDistance -
                    (floatingButtonHorizontalPadding / 2),
                curve: Curves.ease,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ),
            Container(
              height: barBgSize,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    6,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedItem = index;
                        });
                      },
                      child: IconButton(
                        icon: Icon(
                          index % 2 == 0 ? Icons.access_alarm : Icons.abc,
                          size: 25,
                        ),
                        key: iconKeys[index],
                        onPressed: () {
                          setState(() {
                            selectedItem = index;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
