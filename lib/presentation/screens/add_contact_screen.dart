import "package:contacts_service/contacts_service.dart";
import "package:dial_verse/core/constants/index.dart";
import "package:dial_verse/presentation/controllers/dial_controller.dart";
import "package:dial_verse/presentation/widgets/app_bar.dart";
import "package:dial_verse/presentation/widgets/dv_button.dart";
import "package:dial_verse/presentation/widgets/dv_divider.dart";
import "package:dial_verse/presentation/widgets/dv_loader.dart";
import "package:dial_verse/presentation/widgets/dv_message.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../core/theme/app_palette.dart";
import "menu_screen.dart";

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({super.key});

  @override
  State<AddContactScreen> createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final TextEditingController _first = TextEditingController();
  final TextEditingController _last = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final List<TextEditingController> _emails = List.empty(growable: true);
  final List<TextEditingController> _phones = [TextEditingController()];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final controller = Get.find<DialController>();

  @override
  void dispose() {
    _first.dispose();
    _last.dispose();
    _address.dispose();
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

  void addContact() {
    if (_formKey.currentState!.validate()) {
      final Contact contact = Contact(
        displayName: "${_first.text.trim()} ${_last.text.trim()}",
        phones: _phones.map((p) => Item(value: p.text.trim())).toList(),
        emails: _emails.map((e) => Item(value: e.text.trim())).toList(),
      );
      controller.insertNewContact(contact: contact);
      setState(() {
        _first.clear();
        _last.clear();
        _address.clear();
        _emails.clear();
        _phones.clear();
        _phones.add(TextEditingController());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuScreen(),
      drawerScrimColor: AppPalette.transparent,
      appBar: appBar(
        context: context,
        title: "Add New Contact",
        isSearchable: false,
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
                      controller: _first,
                      decoration: const InputDecoration(
                        labelText: "first name",
                      ),
                      validator: (value) {
                        if (value!.trim().isEmpty || value.trim().length < 3) {
                          return "at least 3 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),
                    TextFormField(
                      controller: _last,
                      decoration: const InputDecoration(
                        labelText: "last name",
                      ),
                      validator: (value) {
                        if (value!.trim().isEmpty || value.trim().length < 3) {
                          return "at least 3 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24.0),
                    // TextFormField(
                    //   controller: _address,
                    //   maxLines: null,
                    //   decoration: const InputDecoration(
                    //     labelText: "address",
                    //   ),
                    // ),
                    // const SizedBox(height: 24.0),
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
                      child: DVButton(label: "done", onPress: addContact),
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
