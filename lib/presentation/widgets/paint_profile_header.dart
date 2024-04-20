import "package:dial_verse/core/theme/app_palette.dart";
import "package:dial_verse/core/utils/extensions.dart";
import "package:flutter/material.dart";

class PaintProfileHeader extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // final paint = Paint()
    //   ..style = PaintingStyle.fill
    //   ..color = AppPalette.lightPrimary.withOpacity(0.5);

    final gradient = AppPalette.lightGradient.copyWith(
      colors: [
        AppPalette.lightPrimary.withOpacity(0.3),
        AppPalette.darkPrimary.withOpacity(0.3),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );
    final shader = gradient.createShader(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height,
      ),
    );

    final paint = Paint()..shader = shader;

    final path = Path()
      ..lineTo(0, size.height * 0.85)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.85,
        size.width,
        0,
      )
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
