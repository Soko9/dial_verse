import "package:contacts_service/contacts_service.dart";
import "package:flutter/material.dart";

import "../../core/constants/app_dimensions.dart";
import "../../core/theme/app_palette.dart";

class ContactsTile extends StatelessWidget {
  final Contact contact;

  const ContactsTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 0,
        ),
        leading: CircleAvatar(
          backgroundColor: AppPalette.primary,
          radius: AppDimensions.avatarRadius,
          child: FittedBox(
            child: Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                // contact.displayName.contains(" ")
                //     ? "${contact.displayName.split(" ")[0][0]}${contact.displayName.split(" ")[1][0]}"
                //     : contact.displayName[0],
                "",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          // contact.displayName,
          "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
        subtitle: Text(
          // contact.phones[0].normalizedNumber,
          "",
          style: TextStyle(
            fontSize: 14.0,
            color: AppPalette.grey,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
