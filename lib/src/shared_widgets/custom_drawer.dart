import 'package:flutter/material.dart';

import '../misc/enums.dart';
import '../model/drawing.dart';

class CustomDrawer extends CustomPainter {
  final List<Drawing> drawings;
  const CustomDrawer({required this.drawings});
  @override
  void paint(Canvas canvas, Size size) {
    for (var drawing in drawings) {
      final item = drawing.points;
      if (item.isEmpty) return;
      final path = Path();
      path.moveTo(item[0].dx, item[0].dy);
      if (item.length == 1) {
        path.addOval(
            Rect.fromCircle(center: Offset(item[0].dx, item[0].dy), radius: 1));
      }
      for (int i = 1; i < item.length - 1; ++i) {
        final p0 = item[i];
        final p1 = item[i + 1];
        path.quadraticBezierTo(
          p0.dx,
          p0.dy,
          (p0.dx + p1.dx) / 2,
          (p0.dy + p1.dy) / 2,
        );
      }
      Paint paint = Paint();
      paint.color = drawing.color;
      paint.style = PaintingStyle.stroke;
      paint.strokeCap = StrokeCap.round;
      paint.strokeWidth = drawing.size;

      Offset firstPoint = drawing.points.first;
      Offset lastPoint = drawing.points.last;
      Rect rect = Rect.fromPoints(firstPoint, lastPoint);
      Offset center = (firstPoint / 2) + (lastPoint / 2);
      double radius = (firstPoint - lastPoint).distance / 2;

      if (drawing.type == DrawingType.scribble ||
          drawing.type == DrawingType.eraser) {
        canvas.drawPath(path, paint);
      } else if (drawing.type == DrawingType.oval) {
        canvas.drawOval(rect, paint);
      } else if (drawing.type == DrawingType.circle) {
        canvas.drawCircle(center, radius, paint);
      } else {
        canvas.drawRRect(
          RRect.fromRectAndRadius(rect, const Radius.circular(5)),
          paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomDrawer oldDelegate) {
    return oldDelegate.drawings != drawings;
  }
}
