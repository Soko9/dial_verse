import "package:dial_verse/core/theme/app_palette.dart";
import "package:flutter/material.dart";

import "../../core/constants/index.dart";

class DVAvatar extends StatelessWidget {
  final String? label;
  final double? size;
  final Color? color;
  final Gradient? gradient;
  final Widget? child;
  final VoidCallback? onPress;

  const DVAvatar({
    super.key,
    this.label,
    this.size = AppDimensions.avatarRadius * 1.5,
    this.color,
    this.gradient = AppPalette.darkGradient,
    this.child,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: size,
        height: size,
        margin: const EdgeInsets.only(left: 4.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: color == null ? gradient : null,
          color: color,
        ),
        child: child != null
            ? child!
            : FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    label!.split(" ")[0][0].toUpperCase(),
                    style: const TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
