import "package:dial_verse/core/constants/app_assets.dart";
import "package:dial_verse/core/navigation/app_routes.dart";

class MenuEntity {
  final String icon;
  final String label;
  final String screenToNavigate;

  MenuEntity({
    required this.icon,
    required this.label,
    required this.screenToNavigate,
  });

  static List<MenuEntity> menuItems = [
    MenuEntity(
      icon: AppAssets.iconHome,
      label: "Home",
      screenToNavigate: AppRoutes.routeActivity,
    ),
    MenuEntity(
      icon: AppAssets.iconContacts,
      label: "Contacts",
      screenToNavigate: AppRoutes.routeContacts,
    ),
    MenuEntity(
      icon: AppAssets.iconNotifications,
      label: "Notifications",
      screenToNavigate: "",
    ),
    MenuEntity(
      icon: AppAssets.iconBlock,
      label: "Block List",
      screenToNavigate: "",
    ),
    MenuEntity(
      icon: AppAssets.iconFaq,
      label: "FAQ",
      screenToNavigate: "",
    ),
    MenuEntity(
      icon: AppAssets.iconSettings,
      label: "Settings",
      screenToNavigate: "",
    ),
  ];
}
