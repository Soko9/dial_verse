import "package:dial_verse/app_bindings.dart";
import "package:dial_verse/core/navigation/app_routes.dart";
import "package:dial_verse/core/theme/app_theme.dart";
import "package:dial_verse/core/utils/app_permissions.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

// ?: add confirmation dialog for deleting a contact
// ?: add call functionality
// ?: add sms functionality
// ?: get all the activities of the caller

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPermissions.requestPermissions();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "DialVerse",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      darkTheme: AppTheme.theme,
      initialBinding: AppBindings(),
      initialRoute: AppRoutes.routeActivity,
      getPages: AppRoutes.routes,
    );
  }
}
