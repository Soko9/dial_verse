import "package:dial_verse/core/constants/app_assets.dart";
import "package:dial_verse/core/constants/app_dimensions.dart";
import "package:dial_verse/core/theme/app_palette.dart";
import "package:flutter/material.dart";
import "package:flutter_contacts/flutter_contacts.dart";

class ActivityTile extends StatelessWidget {
  final Contact contact;

  const ActivityTile({super.key, required this.contact});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 0,
        ),
        leading: CircleAvatar(
          backgroundColor: AppPalette.primary,
          radius: AppDimensions.avatarRadius,
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                contact.displayName.contains(" ")
                    ? "${contact.displayName.split(" ")[0][0]}${contact.displayName.split(" ")[1][0]}"
                    : contact.displayName[0],
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          contact.displayName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 18.0,
          ),
        ),
        subtitle: Text(
          contact.phones[0].normalizedNumber,
          style: const TextStyle(
            fontSize: 14.0,
            color: AppPalette.grey,
            fontWeight: FontWeight.w200,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              AppAssets.iconIn,
              width: AppDimensions.dialIconSize,
            ),
            const SizedBox(width: 4.0),
            Text(
              DateTime.now().toIso8601String().split("T")[1].substring(0, 5),
              style: const TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
