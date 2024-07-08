import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Add this CustomPaint widget to the Widget Tree

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(368, 29.2915);
    path_0.cubicTo(343.61, 48.4214, 306.396, 60.4355, 259.196, 60.4355);
    path_0.cubicTo(209.768, 60.4355, 173.949, 84.8185, 141.1, 107.179);
    path_0.cubicTo(97.2181, 137.05, 58.6379, 163.313, 0, 123.015);
    path_0.lineTo(0, 0);
    path_0.lineTo(368, 0);
    path_0.lineTo(368, 29.2915);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5000000, size.height * -3.37113),
        Offset(size.width * 0.5000000, size.height * 0.9960258),
        [const Color(0xff8E0000).withOpacity(1), Colors.white.withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
