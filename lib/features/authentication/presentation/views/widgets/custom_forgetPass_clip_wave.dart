import 'dart:ui' as ui;

import 'package:flutter/material.dart';

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(430, 99.9719);
    path_0.cubicTo(288.95, -31.391, 143.448, 44.6795, 115.843, 101);
    path_0.lineTo(115.78, 101.128);
    path_0.cubicTo(103.675, 125.826, 80.9191, 172.254, 0, 193.229);
    path_0.lineTo(0, -24);
    path_0.lineTo(430, -24);
    path_0.lineTo(430, 99.9719);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
        Offset(size.width * 0.5000000, size.height * -12.37113),
        Offset(size.width * 0.5000000, size.height * 0.9960258),
        [Color(0xff8E0000).withOpacity(1), Colors.white.withOpacity(1)],
        [0, 1]);
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
