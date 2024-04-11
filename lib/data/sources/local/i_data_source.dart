import "package:dial_verse/core/resources/app_error.dart";
import "package:dial_verse/data/sources/local/data_source.dart";
import "package:flutter_contacts/flutter_contacts.dart";

class IDataSource implements DataSource {
  @override
  Future<List<Contact>> retrieveAllContacts() async {
    try {
      print("source");
      if (!await FlutterContacts.requestPermission()) {
        throw const AppError(message: "Request denied!");
      }
      final result = await FlutterContacts.getContacts();
      print(result);
      return [];
    } catch (e) {
      throw AppError(message: e.toString());
    }
  }

  @override
  Future<void> insertContact({required Contact contact}) async {
    try {
      print("source");
      print(contact);
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
