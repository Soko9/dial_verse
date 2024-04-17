import "package:dial_verse/core/utils/extensions.dart";
import "package:dial_verse/domain/entities/dv_contact_entity.dart";
import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

import "../../core/constants/app_dimensions.dart";
import "../../core/theme/app_palette.dart";

class ContactsTile extends StatelessWidget {
  final int index;
  final DVContactEntity contact;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onCall;
  final VoidCallback? onSms;

  const ContactsTile({
    super.key,
    required this.index,
    required this.contact,
    this.onEdit,
    this.onDelete,
    this.onCall,
    this.onSms,
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

    return Slidable(
      key: ValueKey(index),
      closeOnScroll: true,
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => onDelete!(),
            backgroundColor: AppPalette.lightPrimary,
            foregroundColor: AppPalette.black,

            autoClose: true,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              bottomLeft: Radius.circular(4.0),
            ),
            icon: Icons.remove,
            // label: "Delete",
          ),
          SlidableAction(
            onPressed: (context) => onEdit!(),
            backgroundColor: AppPalette.lightPrimary.withOpacity(0.8),
            foregroundColor: AppPalette.black,
            autoClose: true,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(4.0),
              bottomRight: Radius.circular(4.0),
            ),
            icon: Icons.edit,
            // label: "Edit",
          ),
        ],
      ),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => onCall,
            backgroundColor: AppPalette.lightPrimary,
            foregroundColor: AppPalette.black,

            autoClose: true,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4.0),
              bottomLeft: Radius.circular(4.0),
            ),
            icon: Icons.call_rounded,
            // label: "Delete",
          ),
          SlidableAction(
            onPressed: (context) => onSms,
            backgroundColor: AppPalette.lightPrimary.withOpacity(0.8),
            foregroundColor: AppPalette.black,
            autoClose: true,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(4.0),
              bottomRight: Radius.circular(4.0),
            ),
            icon: Icons.sms_rounded,
            // label: "Edit",
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Container(
          width: AppDimensions.avatarRadius * 1.5,
          height: AppDimensions.avatarRadius * 1.5,
          margin: const EdgeInsets.only(left: 4.0),
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
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          contact.displayName,
          maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16.0,
          ),
        ),
        isThreeLine: false,
        subtitle: Text(
          contact.phones[0]!,
          style: const TextStyle(
            fontSize: 12.0,
            color: AppPalette.grey,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    );
  }
}
