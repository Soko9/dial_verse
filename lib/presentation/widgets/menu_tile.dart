import "package:dial_verse/core/constants/app_dimensions.dart";
import "package:dial_verse/domain/entities/menu_entity.dart";
import "package:dial_verse/core/theme/app_palette.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class MenuTile extends StatelessWidget {
  final MenuEntity menu;

  const MenuTile({
    super.key,
    required this.menu,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (menu.screenToNavigate.isNotEmpty &&
            Get.currentRoute != menu.screenToNavigate) {
          Get.offAllNamed(menu.screenToNavigate);
        }
      },
      child: ColoredBox(
        color: Get.currentRoute == menu.screenToNavigate
            ? AppPalette.white
            : AppPalette.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.screenPadding,
            horizontal: AppDimensions.screenPadding,
          ),
          child: Row(
            children: [
              Image.asset(menu.icon, width: AppDimensions.menuIconSize),
              const SizedBox(width: 24.0),
              Text(
                menu.label,
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
