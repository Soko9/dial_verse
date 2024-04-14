import "package:dial_verse/core/utils/extensions.dart";
import "package:dial_verse/domain/entities/dv_contact_entity.dart";
import "package:flutter/material.dart";

import "../../core/constants/app_dimensions.dart";
import "../../core/theme/app_palette.dart";

class ContactsTile extends StatelessWidget {
  final int index;
  final DVContactEntity contact;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const ContactsTile({
    super.key,
    required this.index,
    required this.contact,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final linearGradient = switch (index) {
      int i when i == 0 => AppPalette.darkGradient.copyWith(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      int i when i == 1 => AppPalette.darkGradient.copyWith(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      int i when i % 2 == 0 => AppPalette.darkGradient.copyWith(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      int i when i % 3 == 0 => AppPalette.darkGradient.copyWith(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      int i when i % 4 == 0 => AppPalette.darkGradient.copyWith(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      int i when i % 5 == 0 => AppPalette.darkGradient.copyWith(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      int i when i % 6 == 0 => AppPalette.darkGradient.copyWith(
          end: Alignment.topLeft,
          begin: Alignment.bottomRight,
        ),
      int i when i % 7 == 0 => AppPalette.darkGradient.copyWith(
          end: Alignment.topCenter,
          begin: Alignment.bottomCenter,
        ),
      int i when i % 8 == 0 => AppPalette.darkGradient.copyWith(
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
        ),
      int i when i % 9 == 0 => AppPalette.darkGradient.copyWith(
          end: Alignment.centerLeft,
          begin: Alignment.centerRight,
        ),
      _ => AppPalette.darkGradient,
    };

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 0,
        ),
        leading: Container(
          width: AppDimensions.avatarRadius * 2,
          height: AppDimensions.avatarRadius * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: linearGradient,
          ),
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                contact.displayName.split(" ")[0][0].toUpperCase(),
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          "${contact.displayName}\n${contact.id ?? ""}",
          maxLines: 2,
          // overflow: TextOverflow.ellipsis,
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
