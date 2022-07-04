import 'dart:math';

import 'package:angles/angles.dart';
import 'package:flutter/material.dart';

class MyButton extends CustomPainter {
  final Offset centerPoint;

  MyButton(this.centerPoint);
  @override
  void paint(Canvas canvas, Size size) {
    double radius = 40;
    double triangleA = 30; // this the dimension of triangle's side
    double triangleR = triangleA /
        sqrt(
            3.0); // this the distance between the center of triangle/circle to corner of triangle

    // I am drawing here circle, while you can draw your shape as per your convenience.
    canvas.drawCircle(
        centerPoint,
        radius,
        Paint()
          ..color = Colors.grey[700]!
          ..style = PaintingStyle.fill);

    Path path = Path();

    double x1Point = centerPoint.dx + triangleR * cos(3 * pi / 2);
    double y1Point = centerPoint.dy + triangleR * sin(3 * pi / 2);
    path.moveTo(x1Point, y1Point);

    double x2Point = centerPoint.dx +
        triangleR * cos((3 * pi / 2) - const Angle.fromDegrees(120).radians);
    double y2Point = centerPoint.dy +
        triangleR * sin((3 * pi / 2) - const Angle.fromDegrees(120).radians);
    path.lineTo(x2Point, y2Point);

    double x3Point = centerPoint.dx +
        triangleR * cos((3 * pi / 2) + const Angle.fromDegrees(120).radians);
    double y3Point = centerPoint.dy +
        triangleR * sin((3 * pi / 2) + const Angle.fromDegrees(120).radians);
    path.lineTo(x3Point, y3Point);

    path.close();

    canvas.drawPath(
        path,
        Paint()
          ..color = Colors.deepOrange
          ..style = PaintingStyle.fill);

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
