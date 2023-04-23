class WidgetInfoModel {
  final double width, height;
  final double xDistance, yDistance;

  WidgetInfoModel({
    required this.yDistance,
    required this.height,
    required this.width,
    required this.xDistance,
  });

  @override
  String toString() {
    return 'WidgetModel(width: $width, height: $height, xDistance: $xDistance, yDistance: $yDistance)';
  }
}
