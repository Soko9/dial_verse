import "package:dial_verse/core/constants/index.dart";
import "package:dial_verse/core/navigation/app_routes.dart";
import "package:dial_verse/domain/entities/dv_contact_entity.dart";
import "package:dial_verse/presentation/controllers/dial_controller.dart";
import "package:dial_verse/presentation/widgets/app_bar.dart";
import "package:dial_verse/presentation/widgets/dv_button.dart";
import "package:dial_verse/presentation/widgets/dv_divider.dart";
import "package:dial_verse/presentation/widgets/dv_loader.dart";
import "package:dial_verse/presentation/widgets/dv_message.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:uuid/uuid.dart";

import "../../core/theme/app_palette.dart";
import "menu_screen.dart";

class AddUpdateContactScreen extends StatefulWidget {
  final bool isUpdating;
  final DVContactEntity? contact;

  const AddUpdateContactScreen({
    super.key,
    this.isUpdating = false,
    this.contact,
  });

  @override
  State<AddUpdateContactScreen> createState() => _AddUpdateContactScreenState();
}

class _AddUpdateContactScreenState extends State<AddUpdateContactScreen> {
  final TextEditingController _prefix = TextEditingController();
  final TextEditingController _first = TextEditingController();
  final TextEditingController _middle = TextEditingController();
  final TextEditingController _last = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _country = TextEditingController();
  List<TextEditingController> _emails = List.empty(growable: true);
  List<TextEditingController> _phones = [TextEditingController()];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final controller = Get.find<DialController>();

  @override
  void initState() {
    super.initState();
    if (widget.isUpdating) {
      _prefix.text = widget.contact?.prefix ?? "";
      _first.text = widget.contact?.first ?? "";
      _middle.text = widget.contact?.middle ?? "";
      _last.text = widget.contact?.last ?? "";
      _city.text = widget.contact?.city ?? "";
      _country.text = widget.contact?.country ?? "";
      _emails = widget.contact!.emails
          .map((e) => TextEditingController(text: e))
          .toList();
      _phones = widget.contact!.phones
          .map((p) => TextEditingController(text: p!.removeAllWhitespace))
          .toList();
    }
  }

  @override
  void dispose() {
    _prefix.dispose();
    _first.dispose();
    _middle.dispose();
    _last.dispose();
    _city.dispose();
    _country.dispose();
    for (final TextEditingController controller in _emails) {
      controller.dispose();
    }
    for (final TextEditingController controller in _phones) {
      controller.dispose();
    }
    super.dispose();
  }

  void addEmail() {
    setState(() {
      _emails.add(TextEditingController());
    });
  }

  void addPhone() {
    setState(() {
      _phones.add(TextEditingController());
    });
  }

  void removeEmail() {
    setState(() {
      _emails.removeLast();
    });
  }

  void removePhone() {
    if (_phones.length > 1) {
      setState(() {
        _phones.removeLast();
      });
    }
  }

  void upsertContact() {
    if (_formKey.currentState!.validate()) {
      final DVContactEntity contact = DVContactEntity(
        id: widget.isUpdating ? widget.contact!.id : const Uuid().v4(),
        prefix: _prefix.text.trim(),
        first: _first.text.trim(),
        middle: _middle.text.trim(),
        last: _last.text.trim(),
        city: _city.text.trim(),
        country: _country.text.trim(),
        phones: _phones.map((p) => p.text.trim()).toList(),
        emails: _emails.map((e) => e.text.trim()).toList(),
      );
      if (widget.isUpdating) {
        controller.updateContact(contact: contact);
      } else {
        controller.insertContact(contact: contact);
      }
      clear();
    }
  }

  void deleteContact() {
    controller.deleteContact(contact: widget.contact!);
    clear();
  }

  void clear() {
    setState(() {
      _prefix.clear();
      _first.clear();
      _middle.clear();
      _last.clear();
      _city.clear();
      _country.clear();
      _emails.clear();
      _phones.clear();
      _phones.add(TextEditingController());
    });
    Get.offAllNamed(AppRoutes.routeContacts);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuScreen(),
      drawerScrimColor: AppPalette.transparent,
      appBar: appBar(
        context: context,
        title: "${widget.isUpdating ? "Update" : "New"} Contact",
        isSearchable: false,
        actions: widget.isUpdating
            ? [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: IconButton(
                    onPressed: deleteContact,
                    icon: const Icon(
                      Icons.delete_outline,
                      color: AppPalette.red,
                      size: AppDimensions.menuIconSize,
                    ),
                  ),
                ),
              ]
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimensions.screenPadding),
        child: GetBuilder<DialController>(
          builder: (controller) {
            if (controller.isLoading) {
              return const DVLoader();
            }
            if (controller.error.isNotEmpty) {
              return DVMessage(
                message: controller.error,
                color: AppPalette.red,
              );
            }
            return Form(
              key: _formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DVDivider(),
                    TextFormField(
                      controller: _prefix,
                      decoration: const InputDecoration(
                        labelText: "prefix",
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    TextFormField(
                      controller: _first,
                      decoration: const InputDecoration(
                        labelText: "first name",
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    TextFormField(
                      controller: _middle,
                      decoration: const InputDecoration(
                        labelText: "middle name",
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    TextFormField(
                      controller: _last,
                      decoration: const InputDecoration(
                        labelText: "last name",
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    TextFormField(
                      controller: _city,
                      decoration: const InputDecoration(
                        labelText: "city",
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    TextFormField(
                      controller: _country,
                      decoration: const InputDecoration(
                        labelText: "country",
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Add Email",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: addEmail,
                          icon: const Icon(Icons.attach_email),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: _emails
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: e,
                                      decoration: const InputDecoration(
                                        hintText: "email",
                                      ),
                                      validator: (value) {
                                        if (value!.trim().isEmpty ||
                                            !GetUtils.isEmail(value)) {
                                          return "must be a valid email";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: removeEmail,
                                    icon: const Icon(Icons.remove),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 24.0),
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Add Phone",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: addPhone,
                          icon: const Icon(Icons.add_ic_call_rounded),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: _phones
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: e,
                                      decoration: const InputDecoration(
                                        hintText: "phone",
                                      ),
                                      validator: (value) {
                                        if (value!.trim().isEmpty ||
                                            !GetUtils.isPhoneNumber(value)) {
                                          return "must be a valid phone number";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: removePhone,
                                    icon: const Icon(Icons.remove),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 48.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: DVButton(
                        label: widget.isUpdating ? "update" : "done",
                        onPress: upsertContact,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
