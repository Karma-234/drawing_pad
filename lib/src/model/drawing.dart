import 'dart:ui';

import 'package:custom_paint_animation/src/misc/enums.dart';

class Drawing {
  final List<Offset> points;
  final Color color;
  final double size;
  final DrawingType type;
  final int sides;

  Drawing(
      {required this.points,
      required this.color,
      required this.size,
      required this.type,
      this.sides = 0});
}
