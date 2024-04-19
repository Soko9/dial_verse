import "package:dial_verse/core/theme/app_palette.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../core/constants/app_assets.dart";
import "../../core/constants/app_dimensions.dart";

PreferredSizeWidget appBar({
  required BuildContext context,
  required String title,
  required bool isSearchable,
  void Function(String value)? onSearch,
  bool? isSearching,
  VoidCallback? onSearchToggle,
  List<Widget>? actions,
  bool isDouble = true,
}) =>
    AppBar(
      backgroundColor: AppPalette.transparent,
      leading: Builder(
        builder: (context) {
          return IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Image.asset(
              AppAssets.iconMenu,
              width: AppDimensions.iconSize,
            ),
          );
        },
      ),
      bottom: isDouble
          ? AppBar(
              backgroundColor: AppPalette.transparent,
              leading: Navigator.of(context).canPop()
                  ? IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(Icons.arrow_back),
                    )
                  : null,
              automaticallyImplyLeading: false,
              title: isSearchable
                  ? isSearching!
                      ? TextField(
                          autofocus: true,
                          decoration: const InputDecoration(
                            hintText: "search contacts",
                          ),
                          onChanged: onSearch,
                        )
                      : FittedBox(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                  : FittedBox(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
              actions: isSearchable
                  ? [
                      Padding(
                        padding: EdgeInsets.only(
                          right: actions == null
                              ? AppDimensions.screenPadding
                              : 8.0,
                        ),
                        child: IconButton(
                          onPressed: onSearchToggle,
                          icon: Image.asset(
                            isSearching!
                                ? AppAssets.iconCross
                                : AppAssets.iconSearch,
                            width: AppDimensions.iconSize,
                          ),
                        ),
                      ),
                      ...actions!,
                    ]
                  : actions,
            )
          : null,
    );
