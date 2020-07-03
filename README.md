# Animated Bottom Navigation

[![pub package](https://img.shields.io/pub/v/bottom_animation?color=green&style=flat-square)](https://pub.dev/packages/bottom_animation)

##### Flutter `package` for `add bottomNavigation` to you application

### Show case :

|                     Flat Navigation Bar                      |                      With border radius                      |                           Dark One                           |
| :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
| ![purpule](https://github.com/mahmoud-eslami/bottom_animation/blob/master/files/purple-showCase.gif) | ![blue_gray](https://github.com/mahmoud-eslami/bottom_animation/blob/master/files/blueGray-showCase.gif) | ![dark](https://github.com/mahmoud-eslami/bottom_animation/blob/master/files/black-showCase.gif) |

### How to use :

### Widget parameters :

|         name          |        type         | description |                        default_value                         |
| :-------------------: | :-----------------: | :---------: | :----------------------------------------------------------: |
|     selectedIndex     |         int         |             |                              -                               |
|         items         | List<BottomNavItem> |             |                              -                               |
|    backgroundColor    |        Color        |             |                              -                               |
|    activeIconColor    |        Color        |             |                              -                               |
|   deactiveIconColor   |        Color        |             |                              -                               |
|       iconSize        |       double        |             |                              30                              |
|       textStyle       |      TextStyle      |             | TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w300) |
|     onItemSelect      |  ValueChanged<int>  |             |                              -                               |
|       barHeight       |       double        |             |                              80                              |
|       barRadius       |       double        |             |                              0                               |
|    itemHoverColor     |        Color        |             |                              -                               |
| itemHoverColorOpacity |       double        |             |                              13                              |
| itemHoverBorderRadius |       double        |             |                              15                              |
|    itemHoverWidth     |       double        |             |                             150                              |
|    itemHoverHeight    |       double        |             |                              55                              |

### BottomNavItem :

|   name   |   type   |
| :------: | :------: |
|  title   |  String  |
| iconData | IconData |

