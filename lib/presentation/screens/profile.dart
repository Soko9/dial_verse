import "package:dial_verse/core/constants/index.dart";
import "package:dial_verse/core/theme/app_theme.dart";
import "package:dial_verse/domain/entities/dv_contact_entity.dart";
import "package:dial_verse/presentation/screens/add_update_contact_screen.dart";
import "package:dial_verse/presentation/widgets/paint_profile_header.dart";
import "package:dial_verse/presentation/widgets/profile_menu.dart";
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
            SizedBox(
              width: size.width * 0.8,
              height: size.height * 0.3,
              child: CustomPaint(
                painter: PaintProfileHeader(),
              ),
            ),
            ProfileMenu(
              editCallback: () {
                Get.to(
                  () => AddUpdateContactScreen(
                    isUpdating: true,
                    contact: contact,
                  ),
                );
              },
            ),
            Positioned(
              width: size.width,
              top: size.height * 0.1 + size.width * 0.3 + size.height * 0.025,
              right: 0,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: size.width * 0.3,
                      child: Text(
                        contact.prefix ?? "No\nPrefix",
                        textAlign: contact.prefix == null
                            ? TextAlign.center
                            : TextAlign.end,
                        style: TextStyle(
                          fontSize: contact.prefix == null ? 14.0 : 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        gradient: AppPalette.gradient,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          bottomLeft: Radius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        contact.displayNameLined,
                        textAlign: TextAlign.start,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 36.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: (!contact.displayNameLined.contains("\n")
                      ? size.height * 0.115
                      : contact.displayNameLined.split("\n").length == 2
                          ? size.height * 0.185
                          : size.height * 0.265) +
                  size.height * 0.1 +
                  size.width * 0.3 +
                  size.height * 0.025,
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
                        fontSize: 24.0,
                        color: AppPalette.black,
                      ),
                      children: [
                        TextSpan(
                          text: contact.address.isEmpty ? "-" : contact.address,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  Text(contact.emails.isEmpty ? "" : contact.emails[0]!),
                  const SizedBox(height: 12.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
