import "package:permission_handler/permission_handler.dart";

abstract class AppPermissions {
  static Future requestPermissions() async {
    if (await Permission.contacts.isGranted) return;
    await Permission.contacts.request();
  }

  static Future<bool> get contactsPermission async =>
      await Permission.contacts.isGranted;
}
