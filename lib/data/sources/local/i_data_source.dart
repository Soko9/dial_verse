import "package:contacts_service/contacts_service.dart";
import "package:dial_verse/core/resources/app_error.dart";
import "package:dial_verse/core/utils/app_permissions.dart";
import "package:dial_verse/data/sources/local/data_source.dart";

class IDataSource implements DataSource {
  @override
  Future<List<Contact>> retrieveAllContacts() async {
    try {
      if (!await AppPermissions.contactsPermission) {
        throw const AppError(message: "Contacts permission is denied!");
      }
      final result = await ContactsService.getContacts(withThumbnails: false);
      return result;
    } catch (e) {
      throw AppError(message: e.toString());
    }
  }

  @override
  Future<void> insertContact({required Contact contact}) async {
    try {
      final result = await ContactsService.addContact(contact);
      print(result);
    } catch (e) {
      throw AppError(message: e.toString());
    }
  }

  @override
  Future<void> updateContact({required Contact contact}) async {
    try {
      // TODO
    } catch (e) {
      throw AppError(message: e.toString());
    }
  }

  @override
  Future<void> deleteContact({required Contact contact}) async {
    try {
      // TODO
    } catch (e) {
      throw AppError(message: e.toString());
    }
  }

  @override
  Future<void> dialPhone({required String number}) async {
    try {
      // TODO
    } catch (e) {
      throw AppError(message: e.toString());
    }
  }

  @override
  Future<void> sendSms({
    required String number,
    required String message,
  }) async {
    try {
      // TODO
    } catch (e) {
      throw AppError(message: e.toString());
    }
  }
}
