import "package:dial_verse/core/constants/app_dimensions.dart";
import "package:dial_verse/core/theme/app_palette.dart";
import "package:dial_verse/presentation/controllers/dial_controller.dart";
import "package:dial_verse/presentation/widgets/app_bar.dart";
import "package:dial_verse/presentation/widgets/dv_divider.dart";
import "package:dial_verse/presentation/widgets/dv_message.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "menu_screen.dart";

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuScreen(),
      drawerScrimColor: AppPalette.transparent,
      appBar: appBar(
        context: context,
        title: "Latest Activity",
        isSearchable: false,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppDimensions.screenPadding,
          AppDimensions.screenPadding,
          AppDimensions.screenPadding,
          0,
        ),
        child: Column(
          children: [
            const DVDivider(),
            Expanded(
              child: GetBuilder<DialController>(
                builder: (controller) {
                  // if (controller.isLoading) {
                  //   return const DVLoader();
                  // }
                  // if (controller.error.isNotEmpty) {
                  //   return DVMessage(
                  //     message: controller.error,
                  //     color: AppPalette.red,
                  //   );
                  // }
                  // if (controller.contacts.isEmpty) {
                  return const DVMessage(
                    message: "No activity yet!",
                    color: AppPalette.grey,
                  );
                  // }
                  // return ListView.builder(
                  //   itemCount: controller.contacts.length,
                  //   shrinkWrap: true,
                  //   itemBuilder: (_, index) => ActivityTile(
                  //     contact: controller.contacts[index],
                  //   ),
                  // );
                },
              ),
            ),
            // const ActivityNavigator(),
          ],
        ),
      ),
    );
  }
}
