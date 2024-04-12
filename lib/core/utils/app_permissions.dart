import "package:flutter_easy_permission/easy_permissions.dart";

abstract interface class AppPermissions {
  static const List<Permissions> androidPermissions = [
    Permissions.READ_CONTACTS,
    Permissions.WRITE_CONTACTS,
    Permissions.CALL_PHONE,
    Permissions.PROCESS_OUTGOING_CALLS,
    Permissions.READ_CALL_LOG,
    Permissions.READ_SMS,
    Permissions.RECEIVE_SMS,
    Permissions.RECEIVE_MMS,
    Permissions.SEND_SMS,
  ];

  static const List<PermissionGroup> iosPermissions = [
    PermissionGroup.Contacts,
    PermissionGroup.Microphone,
  ];

  static Future<bool> hasPermissions() async {
    final bool has = await FlutterEasyPermission.has(
      perms: androidPermissions,
      permsGroup: iosPermissions,
    );
    return has;
  }

  static Future<void> requestPermissions() async {
    if (!await hasPermissions()) {
      FlutterEasyPermission.request(
        perms: androidPermissions,
        permsGroup: iosPermissions,
      );
    }
  }
}
