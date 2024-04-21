import "package:dial_verse/domain/entities/dv_contact_entity.dart";
import "package:dial_verse/presentation/controllers/dial_controller.dart";
import "package:dial_verse/presentation/screens/add_update_contact_screen.dart";
import "package:dial_verse/presentation/screens/profile.dart";
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
  List<DVContactEntity> searchedContacts = [];
  bool _isSearching = false;
  final controller = Get.find<DialController>();

  @override
  void initState() {
    super.initState();
    controller.isLoading = true;
    Future.delayed(const Duration(milliseconds: 250), () {
      setState(() {
        searchedContacts = controller.contacts;
      });
      controller.isLoading = false;
    });
  }

  void search({required String query}) {
    final temp = controller.contacts
        .where(
          (contact) =>
              contact.first.toLowerCase().startsWith(query.toLowerCase()) ||
              (contact.last != null &&
                  contact.last!.toLowerCase().startsWith(query.toLowerCase())),
        )
        .toList();
    setState(() {
      searchedContacts = temp;
    });
  }

  void onSearchToggle() {
    setState(() {
      _isSearching = !_isSearching;
      searchedContacts = controller.contacts;
    });
  }

  void goToAddUpdateContact({
    bool isUpdating = false,
    DVContactEntity? contact,
  }) {
    Get.to(() => AddUpdateContactScreen(
          isUpdating: isUpdating,
          contact: contact,
        ));
  }

  void goToProfile({required DVContactEntity contact}) {
    Get.to(
      () => Profile(
        contact: contact,
      ),
    );
  }

  void onDelete({required DVContactEntity contact}) {
    controller.deleteContact(
      contact: contact,
    );
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
        isSearching: _isSearching,
        onSearch: (value) => search(query: value.trim()),
        onSearchToggle: onSearchToggle,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              onPressed: goToAddUpdateContact,
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
                    itemCount: searchedContacts.length,
                    shrinkWrap: true,
                    itemBuilder: (_, index) {
                      return ContactsTile(
                        index: index,
                        contact: searchedContacts[index],
                        onPress: () =>
                            goToProfile(contact: searchedContacts[index]),
                        onEdit: () => goToAddUpdateContact(
                          isUpdating: true,
                          contact: searchedContacts[index],
                        ),
                        onDelete: () =>
                            onDelete(contact: searchedContacts[index]),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
