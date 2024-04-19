import "package:dial_verse/core/theme/app_palette.dart";
import "package:flutter/material.dart";

import "../../core/constants/index.dart";

class DVAvatar extends StatelessWidget {
  final String label;
  final double? size;

  const DVAvatar({
    super.key,
    required this.label,
    this.size = AppDimensions.avatarRadius * 1.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.only(left: 4.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppPalette.darkGradient,
      ),
      child: FittedBox(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            label.split(" ")[0][0].toUpperCase(),
            style: const TextStyle(
              fontSize: 26.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
