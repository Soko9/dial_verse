import "package:contacts_service/contacts_service.dart";

abstract interface class DataSource {
  Future<List<Contact>> retrieveAllContacts();

  Future<bool> insertContact({required Contact contact});

  Future<bool> updateContact({required Contact contact});

  Future<bool> deleteContact({required Contact contact});

  Future<bool> dialPhone({required String number});

  Future<bool> sendSms({required String number, required String message});
}
