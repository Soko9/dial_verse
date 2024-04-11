import "package:dial_verse/core/constants/app_assets.dart";
import "package:dial_verse/core/constants/app_dimensions.dart";
import "package:dial_verse/domain/entities/menu_entity.dart";
import "package:dial_verse/presentation/widgets/menu_tile.dart";
import "package:dial_verse/core/theme/app_palette.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: AppPalette.primaryGradient,
        boxShadow: const [
          BoxShadow(
            offset: Offset.zero,
            color: AppPalette.white,
          ),
        ],
      ),
      child: SizedBox(
        width: Get.size.width * 0.8,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Image.asset(
                AppAssets.iconCross,
                width: AppDimensions.iconSize,
              ),
            ),
          ),
          backgroundColor: AppPalette.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.screenPadding),
            child: ListView(
              shrinkWrap: true,
              children: MenuEntity.menuItems
                  .map(
                    (item) => MenuTile(menu: item),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
