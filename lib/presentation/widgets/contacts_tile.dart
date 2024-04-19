import "package:dial_verse/domain/entities/dv_contact_entity.dart";
import "package:dial_verse/presentation/widgets/dv_avatar.dart";
import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";

import "../../core/theme/app_palette.dart";

class ContactsTile extends StatelessWidget {
  final int index;
  final DVContactEntity contact;
  final VoidCallback? onPress;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onCall;
  final VoidCallback? onSms;

  const ContactsTile({
    super.key,
    required this.index,
    required this.contact,
    this.onPress,
    this.onEdit,
    this.onDelete,
    this.onCall,
    this.onSms,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Slidable(
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
          leading: DVAvatar(label: contact.displayName),
          title: Text(
            contact.displayName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
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
      ),
    );
  }
}
