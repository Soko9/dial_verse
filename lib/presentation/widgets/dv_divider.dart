import "package:flutter/material.dart";

import "../../core/constants/index.dart";
import "../../core/theme/app_palette.dart";

class DVDivider extends StatelessWidget {
  const DVDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Divider(
          color: AppPalette.border,
          indent: (AppDimensions.screenPadding * 3),
          endIndent: (AppDimensions.screenPadding * 3),
        ),
        SizedBox(height: 12.0),
      ],
    );
  }
}
