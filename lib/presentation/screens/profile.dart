import "package:dial_verse/core/constants/index.dart";
import "package:dial_verse/core/theme/app_theme.dart";
import "package:dial_verse/domain/entities/dv_contact_entity.dart";
import "package:dial_verse/presentation/screens/add_update_contact_screen.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../core/theme/app_palette.dart";

class Profile extends StatelessWidget {
  final DVContactEntity contact;

  const Profile({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.2,
              color: AppPalette.darkPrimary.withOpacity(0.3),
            ),
            Positioned(
              top: size.height * 0.12,
              left: AppDimensions.screenPadding,
              right: AppDimensions.screenPadding,
              child: Column(
                children: [
                  Text(
                    contact.prefix ?? "-",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.cover,
                    child: Text(
                      contact.displayName,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.275,
              left: AppDimensions.screenPadding,
              right: AppDimensions.screenPadding,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        height: size.height * 0.1,
                        decoration: BoxDecoration(
                          color: AppPalette.darkPrimary.withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(8.0),
                            bottomLeft: Radius.circular(8.0),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.sms_outlined,
                            color: AppPalette.white,
                            size: AppDimensions.iconSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 2.0),
                  Expanded(
                    child: GestureDetector(
                      child: Container(
                        height: size.height * 0.1,
                        color: AppPalette.darkPrimary.withOpacity(0.7),
                        child: const Center(
                          child: Icon(
                            Icons.call_outlined,
                            color: AppPalette.white,
                            size: AppDimensions.iconSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 2.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          () => AddUpdateContactScreen(
                            isUpdating: true,
                            contact: contact,
                          ),
                        );
                      },
                      child: Container(
                        height: size.height * 0.1,
                        decoration: BoxDecoration(
                          color: AppPalette.darkPrimary.withOpacity(0.7),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8.0),
                            bottomRight: Radius.circular(8.0),
                          ),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.edit_outlined,
                            color: AppPalette.white,
                            size: AppDimensions.iconSize,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: size.height * 0.425,
              left: AppDimensions.screenPadding,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "lives in ",
                      style: const TextStyle(
                        fontFamily: AppTheme.fontCaviar,
                        fontSize: 20.0,
                        color: AppPalette.black,
                      ),
                      children: [
                        TextSpan(
                          text: contact.address.isEmpty ? "-" : contact.address,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppPalette.darkPrimary.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: AppDimensions.screenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Phones:",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        ...contact.phones.map(
                          (p) => Row(
                            children: [
                              const Icon(
                                Icons.arrow_right_alt_rounded,
                                color: AppPalette.transparent,
                              ),
                              const SizedBox(width: 4.0),
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 4.0),
                                  decoration: BoxDecoration(
                                    color:
                                        AppPalette.darkPrimary.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Text(p!),
                                      ),
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.sms_outlined,
                                            size: 16.0,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: 12.0,
                                              right: 8.0,
                                            ),
                                            child: Icon(
                                              Icons.phone_outlined,
                                              size: 16.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: AppDimensions.screenPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Emails:",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        contact.emails.isEmpty
                            ? const Row(
                                children: [
                                  Icon(
                                    Icons.arrow_right_alt_rounded,
                                    color: AppPalette.transparent,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    "-",
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  ...contact.emails.map(
                                    (e) => Row(
                                      children: [
                                        const Icon(
                                          Icons.arrow_right_alt_rounded,
                                          color: AppPalette.transparent,
                                        ),
                                        const SizedBox(width: 4.0),
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.all(6.0),
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 4.0),
                                            decoration: BoxDecoration(
                                              color: AppPalette.darkPrimary
                                                  .withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                            ),
                                            child: Text(e!),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
