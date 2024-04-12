import "package:contacts_service/contacts_service.dart";

abstract interface class DataSource {
  Future<List<Contact>> retrieveAllContacts();

  Future<void> insertContact({required Contact contact});

  Future<void> updateContact({required Contact contact});

  Future<void> deleteContact({required Contact contact});

  Future<void> dialPhone({required String number});

  Future<void> sendSms({required String number, required String message});
}
