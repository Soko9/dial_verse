import "package:dial_verse/presentation/screens/add_contact_screen.dart";
import "package:dial_verse/presentation/screens/contacts_screen.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../presentation/screens/activity_screen.dart";

abstract class AppRoutes {
  static const String routeActivity = "/";
  static const String routeContacts = "/contacts";
  static const String routeAddContact = "/addContact";
  static const String routeDial = "/dial";
  static const String routeMessages = "/messages";

  static const Transition _transition = Transition.rightToLeft;
  static const Curve _curve = Curves.fastOutSlowIn;
  static const Duration _duration = Duration(milliseconds: 250);

  static final List<GetPage> routes = [
    GetPage(
      name: routeActivity,
      page: () => const ActivityScreen(),
      transition: _transition,
      transitionDuration: _duration,
      curve: _curve,
    ),
    GetPage(
      name: routeContacts,
      page: () => const ContactsScreen(),
      transition: _transition,
      transitionDuration: _duration,
      curve: _curve,
    ),
    GetPage(
      name: routeAddContact,
      page: () => const AddContactScreen(),
      transition: _transition,
      transitionDuration: _duration,
      curve: _curve,
    ),
  ];
}
