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
  Future<bool> insertContact({required Contact contact}) async {
    try {
      await ContactsService.addContact(contact);
      return true;
    } catch (e) {
      throw AppError(message: e.toString());
    }
  }

  @override
  Future<bool> updateContact({required Contact contact}) async {
    try {
      // TODO
      return false;
    } catch (e) {
      throw AppError(message: e.toString());
    }
  }

  @override
  Future<bool> deleteContact({required Contact contact}) async {
    try {
      // TODO
      return false;
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
