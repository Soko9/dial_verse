import "package:contacts_service/contacts_service.dart";
import "package:dial_verse/core/resources/app_error.dart";
import "package:dial_verse/core/utils/app_permissions.dart";
import "package:dial_verse/data/models/dv_contact_model.dart";
import "package:dial_verse/data/sources/local/data_source.dart";

class IDataSource implements DataSource {
  // ! THIS IS FOR TESTING ONLY
  // List<DVContactModel> contacts = [
  //   DVContactModel(
  //     id: Random().nextInt(999999).toString(),
  //     first: "Yahya",
  //     last: "Saadi",
  //     emails: [],
  //     phones: ["+96170413716"],
  //   ),
  //   DVContactModel(
  //     id: Random().nextInt(999999).toString(),
  //     first: "Soko",
  //     last: "Sakasiko",
  //     emails: ["soko@mail.com"],
  //     phones: [
  //       "+96170413716",
  //       "+905347763680",
  //     ],
  //   ),
  //   DVContactModel(
  //     id: Random().nextInt(999999).toString(),
  //     first: "Walid",
  //     last: "Mardi",
  //     emails: [],
  //     phones: [
  //       "+96170413716",
  //       "+905347763680",
  //     ],
  //   ),
  //   DVContactModel(
  //     id: Random().nextInt(999999).toString(),
  //     first: "Nigga",
  //     last: "Please",
  //     emails: ["please@mail.com", "nigga@mail.com"],
  //     phones: ["+96170413716"],
  //   ),
  // ];

  @override
  Future<List<DVContactModel>> retrieveAllContacts() async {
    try {
      if (!await AppPermissions.contactsPermission) {
        throw const AppError(message: "Contacts permission is denied!");
      }
      final result = await ContactsService.getContacts(withThumbnails: false);
      return result
          .map(
            (e) => DVContactModel.fromContact(contact: e),
          )
          .where(
              (c) => (c.first != null || c.last != null) && c.phones.isNotEmpty)
          .toList();
    } catch (e) {
      throw AppError(message: e.toString());
    }
  }

  @override
  Future<bool> insertContact({required DVContactModel contact}) async {
    try {
      await ContactsService.addContact(contact.toContact());
      return true;
    } catch (e) {
      throw AppError(message: e.toString());
    }
  }

  @override
  Future<bool> updateContact({required DVContactModel contact}) async {
    try {
      await ContactsService.updateContact(contact.toContact());
      return true;
    } catch (e) {
      throw AppError(message: e.toString());
    }
  }

  @override
  Future<bool> deleteContact({required DVContactModel contact}) async {
    try {
      await ContactsService.deleteContact(contact.toContact());
      return true;
    } catch (e) {
      throw AppError(message: e.toString());
    }
  }

  @override
  Future<bool> dialPhone({required String number}) async {
    try {
      // TODO
      return false;
    } catch (e) {
      throw AppError(message: e.toString());
    }
  }

  @override
  Future<bool> sendSms({
    required String number,
    required String message,
  }) async {
    try {
      // TODO
      return false;
    } catch (e) {
      throw AppError(message: e.toString());
    }
  }
}
