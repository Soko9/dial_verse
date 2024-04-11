import "package:dial_verse/core/constants/app_dimensions.dart";
import "package:flutter/material.dart";

class DVLoader extends StatelessWidget {
  const DVLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: AppDimensions.loaderWidth,
        child: LinearProgressIndicator(),
      ),
    );
  }
}
