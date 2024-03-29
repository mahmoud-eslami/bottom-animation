## How to use :

#### 1. Depend on it

Add this to your package's pubspec.yaml file:

```yaml
dependencies:
  bottom_animation: ^<last_version>
```

#### 2. Install it

You can install packages from the command line:

with Flutter:

```dart
$ flutter pub get
```

Alternatively, your editor might support `flutter pub get`. Check the docs for your editor to learn more.

#### 3. Import it

Now in your Dart code, you can use:

```dart
import 'package:bottom_animation/bottom_animation.dart';
```



### Widget parameters :

|          name          |        type         |                description                 |                        default_value                         |
| :--------------------: | :-----------------: | :----------------------------------------: | :----------------------------------------------------------: |
|     selectedIndex      |         int         |           index of selected item           |                              -                               |
| hoverAlignmentDuration |         int         |      controll movement speed of hover      |                      700(milliesecond)                       |
|         items          | List<BottomNavItem> |       list of bottom navigition item       |                              -                               |
|    backgroundColor     |        Color        |   background color of bottom navigation    |                              -                               |
|    activeIconColor     |        Color        |           color of selected item           |                              -                               |
|   deactiveIconColor    |        Color        |          color of unselected item          |                              -                               |
|        iconSize        |       double        |           size of BottomNavIcon            |                              30                              |
|       textStyle        |      TextStyle      | text style for title of each BottomNavItem | TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w300) |
|      onItemSelect      |  ValueChanged<int>  |                     -                      |                              -                               |
|       barHeight        |       double        |          bottom navigation height          |                              80                              |
|       barRadius        |       double        |      bottom navigation border radius       |                              0                               |
|     itemHoverColor     |        Color        |       background color of each item        |                              -                               |
| itemHoverColorOpacity  |       double        |                     -                      |                              13                              |
| itemHoverBorderRadius  |       double        |                     -                      |                              15                              |
|     itemHoverWidth     |       double        |                     -                      |                             150                              |
|    itemHoverHeight     |       double        |                     -                      |                              55                              |

### BottomNavItem :

|   name   |   type   |
| :------: | :------: |
|  title   |  String  |
| iconData | IconData |




## example :

```dart
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var items = <BottomNavItem>[
    BottomNavItem(title: 'Home', iconData: CupertinoIcons.heart),
    BottomNavItem(title: 'Profile', iconData: CupertinoIcons.person),
    BottomNavItem(title: 'Setting', iconData: CupertinoIcons.search),
    BottomNavItem(title: 'tools', iconData: CupertinoIcons.bluetooth),
  ];

  var cIndex;
  @override
  void initState() {
    cIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'example',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomAnimation(
          selectedIndex: cIndex,
          items: items,
          backgroundColor: Colors.blueGrey,
          onItemSelect: (value) {
            setState(() {
              cIndex = value;
            });
          },
          itemHoverColor: Colors.white,
          itemHoverColorOpacity: .9,
          activeIconColor: Colors.blueGrey,
          deactiveIconColor: Colors.white.withOpacity(.9),
          barRadius: 40,
          textStyle: TextStyle(
            color: Colors.blueGrey,
            fontWeight: FontWeight.bold,
          ),
          itemHoverWidth: 130,
          itemHoverBorderRadius: 40,
        ),
      ),
    );
  }
}
```



