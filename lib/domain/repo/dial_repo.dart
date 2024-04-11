import "package:dial_verse/core/resources/app_error.dart";
import "package:flutter_contacts/flutter_contacts.dart";
import "package:fpdart/fpdart.dart";

abstract interface class DialRepo {
  Future<Either<AppError, List<Contact>>> retrieveAllContacts();

  Future<Either<AppError, void>> insertContact({
    required Contact contact,
  });

  Future<Either<AppError, void>> updateContact({
    required Contact contact,
  });

  Future<Either<AppError, void>> deleteContact({
    required Contact contact,
  });

  Future<Either<AppError, void>> dialPhone({
    required String number,
  });

  Future<Either<AppError, void>> sendSms({
    required String number,
    required String message,
  });
}
