import "package:dial_verse/core/theme/app_palette.dart";
import "package:flutter/material.dart";

class PaintProfileHeader extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill
      ..color = AppPalette.lightPrimary.withOpacity(0.3);

    final path = Path()
      ..lineTo(size.width, 0)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.85, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
