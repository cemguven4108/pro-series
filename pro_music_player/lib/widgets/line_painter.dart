import 'package:flutter/material.dart';

class CustomLinePainter extends CustomPainter {
  CustomLinePainter(
    this.percentage,
  );

  double percentage;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    final start = Offset(0, size.height / 2);
    final end = Offset(size.width * percentage, size.height / 2);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
