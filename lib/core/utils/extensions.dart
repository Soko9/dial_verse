import "package:dial_verse/core/theme/app_palette.dart";
import "package:flutter/widgets.dart";

extension LinearGradientX on LinearGradient {
  LinearGradient copyWith({
    Alignment? begin,
    Alignment? end,
    List<Color>? colors,
  }) =>
      LinearGradient(
        colors: colors ?? AppPalette.darkGradient.colors,
        begin: begin ?? AppPalette.darkGradient.begin,
        end: end ?? AppPalette.darkGradient.end,
      );
}
