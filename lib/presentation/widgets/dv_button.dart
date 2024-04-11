import "package:dial_verse/core/constants/index.dart";
import "package:dial_verse/core/theme/app_palette.dart";
import "package:flutter/material.dart";

class DVButton extends StatelessWidget {
  final String label;
  final VoidCallback onPress;

  const DVButton({
    super.key,
    required this.label,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 32.0,
        ),
        decoration: BoxDecoration(
          gradient: AppPalette.primaryGradient,
          borderRadius: BorderRadius.circular(AppDimensions.inputFieldRadius),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
