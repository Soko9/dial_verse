import "package:dial_verse/core/constants/index.dart";
import "package:dial_verse/core/theme/app_theme.dart";
import "package:dial_verse/domain/entities/dv_contact_entity.dart";
import "package:dial_verse/presentation/screens/add_update_contact_screen.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../core/theme/app_palette.dart";

class Profile extends StatelessWidget {
  final DVContactEntity contact;

  const Profile({
    super.key,
    required this.contact,
  });

  void onEdit() {
    Get.to(
      () => AddUpdateContactScreen(
        isUpdating: true,
        contact: contact,
      ),
    );
  }

  void onGeneralCall() {
    // TODO
  }

  void onGeneralSms() {
    // TODO
  }

  void onCall(String number) {
    // TODO
  }

  void onSms(String number) {
    // TODO
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(),
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.2,
              color: AppPalette.darkPrimary.withOpacity(0.3),
            ),
            _name(size),
            _actions(
              size,
              onGeneralSms,
              onGeneralCall,
              onEdit,
            ),
            _details(size),
          ],
        ),
      ),
    );
  }

  Positioned _details(Size size) {
    return Positioned(
      top: size.height * 0.4,
      left: AppDimensions.screenPadding,
      right: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _address(),
          const SizedBox(height: 24.0),
          _section(
            "Phones",
            contact.phones,
            onSms,
            onCall,
          ),
          const SizedBox(height: 24.0),
          _section(
            "Emails",
            contact.emails,
            null,
            null,
          ),
        ],
      ),
    );
  }

  Padding _section(
    String title,
    List<String?> items,
    void Function(String number)? onSms,
    void Function(String number)? onCall,
  ) {
    final bool isPhoneSection = title == "Phones";
    return Padding(
      padding: const EdgeInsets.only(right: AppDimensions.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          ...items.map(
            (i) => Row(
              children: [
                const Icon(
                  Icons.arrow_right_alt_rounded,
                  color: AppPalette.transparent,
                ),
                const SizedBox(width: 4.0),
                Expanded(
                  child: Container(
                    padding: isPhoneSection
                        ? const EdgeInsets.only(left: 8.0)
                        : const EdgeInsets.all(12.0),
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    decoration: BoxDecoration(
                      color: AppPalette.darkPrimary.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            i!,
                            style: TextStyle(
                              fontSize: isPhoneSection ? 16.0 : 20.0,
                            ),
                          ),
                        ),
                        if (isPhoneSection)
                          Row(
                            children: [
                              IconButton(
                                onPressed: () => onSms!(i),
                                padding: EdgeInsets.zero,
                                icon: const Icon(
                                  Icons.sms_outlined,
                                ),
                                iconSize: 18.0,
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 12.0),
                                padding: const EdgeInsets.all(6.0),
                                decoration: BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      width: 1.0,
                                      color: AppPalette.black.withOpacity(0.5),
                                    ),
                                  ),
                                ),
                                child: IconButton(
                                  onPressed: () => onCall!(i),
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(
                                    Icons.phone_outlined,
                                  ),
                                  iconSize: 18.0,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  RichText _address() {
    return RichText(
      text: TextSpan(
        text: "lives in ",
        style: const TextStyle(
          fontFamily: AppTheme.fontCaviar,
          fontSize: 20.0,
          color: AppPalette.black,
        ),
        children: [
          TextSpan(
            text: contact.address.isEmpty ? "-" : contact.address,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppPalette.darkPrimary.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Positioned _actions(
    Size size,
    VoidCallback? onSms,
    VoidCallback? onCall,
    VoidCallback? onEdit,
  ) {
    return Positioned(
      top: size.height * 0.275,
      left: AppDimensions.screenPadding * 1.5,
      right: AppDimensions.screenPadding * 1.5,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: onSms,
              child: Container(
                height: size.height * 0.07,
                decoration: BoxDecoration(
                  color: AppPalette.darkPrimary.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4.0),
                    bottomLeft: Radius.circular(4.0),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.sms_outlined,
                    color: AppPalette.white,
                    size: AppDimensions.iconSize,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 2.0),
          Expanded(
            child: GestureDetector(
              onTap: onCall,
              child: Container(
                height: size.height * 0.07,
                color: AppPalette.darkPrimary.withOpacity(0.7),
                child: const Center(
                  child: Icon(
                    Icons.call_outlined,
                    color: AppPalette.white,
                    size: AppDimensions.iconSize,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 2.0),
          Expanded(
            child: GestureDetector(
              onTap: onEdit,
              child: Container(
                height: size.height * 0.07,
                decoration: BoxDecoration(
                  color: AppPalette.darkPrimary.withOpacity(0.7),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(4.0),
                    bottomRight: Radius.circular(4.0),
                  ),
                ),
                child: const Center(
                  child: Icon(
                    Icons.edit_outlined,
                    color: AppPalette.white,
                    size: AppDimensions.iconSize,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Positioned _name(Size size) {
    return Positioned(
      top: size.height * 0.13,
      left: AppDimensions.screenPadding * 0.5,
      right: AppDimensions.screenPadding * 0.5,
      child: Column(
        children: [
          Text(
            contact.prefix ?? "-",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          FittedBox(
            fit: BoxFit.cover,
            child: Text(
              contact.displayName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
