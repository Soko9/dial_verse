import "package:dial_verse/domain/entities/dv_contact_entity.dart";
import "package:flutter/material.dart";

import "../../core/constants/app_dimensions.dart";
import "../../core/theme/app_palette.dart";

class ContactsTile extends StatelessWidget {
  final DVContactEntity contact;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ContactsTile({
    super.key,
    required this.contact,
    required this.onEdit,
    required this.onDelete,
  });

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
          contact.phones[0]!,
          style: const TextStyle(
            fontSize: 14.0,
            color: AppPalette.grey,
            fontWeight: FontWeight.w200,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(onPressed: onEdit, icon: const Icon(Icons.edit)),
            const SizedBox(width: 8.0),
            IconButton(onPressed: onDelete, icon: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
