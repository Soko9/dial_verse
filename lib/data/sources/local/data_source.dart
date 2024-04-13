import "package:dial_verse/data/models/dv_contact_model.dart";

abstract interface class DataSource {
  Future<List<DVContactModel>> retrieveAllContacts();

  Future<bool> insertContact({required DVContactModel contact});

  Future<bool> updateContact({required DVContactModel contact});

  Future<bool> deleteContact({required DVContactModel contact});

  Future<bool> dialPhone({required String number});

  Future<bool> sendSms({required String number, required String message});
}
