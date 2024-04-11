import "package:dial_verse/core/navigation/app_routes.dart";
import "package:dial_verse/presentation/controllers/dial_controller.dart";
import "package:dial_verse/presentation/widgets/dv_divider.dart";
import "package:dial_verse/presentation/widgets/dv_loader.dart";
import "package:dial_verse/presentation/widgets/dv_message.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../core/constants/app_dimensions.dart";
import "menu_screen.dart";
import "../widgets/app_bar.dart";
import "../../core/theme/app_palette.dart";
import "../widgets/contacts_tile.dart";

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final TextEditingController _searchController = TextEditingController();

  bool _isSearching = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuScreen(),
      drawerScrimColor: AppPalette.transparent,
      appBar: appBar(
        context: context,
        title: "Contacts",
        isSearchable: true,
        searchController: _searchController,
        isSearching: _isSearching,
        onSearchToggle: () {
          setState(() {
            _isSearching = !_isSearching;
            _searchController.clear();
          });
        },
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: () {
                Get.toNamed(AppRoutes.routeAddContact);
              },
              icon: const Icon(Icons.person_add_rounded, size: 28.0),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimensions.screenPadding),
        child: Column(
          children: [
            const DVDivider(),
            Expanded(
              child: GetBuilder<DialController>(
                builder: (controller) {
                  if (controller.isLoading) {
                    return const DVLoader();
                  }
                  if (controller.error.isNotEmpty) {
                    return DVMessage(
                      message: controller.error,
                      color: AppPalette.red,
                    );
                  }
                  if (controller.contacts.isEmpty) {
                    return const DVMessage(
                      message: "No Contacts",
                      color: AppPalette.grey,
                    );
                  }
                  return ListView.builder(
                    itemCount: controller.contacts.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return ContactsTile(contact: controller.contacts[index]);
                    },
                  );
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
