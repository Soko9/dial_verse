import "package:contacts_service/contacts_service.dart";
import "package:dial_verse/core/resources/app_error.dart";
import "package:fpdart/fpdart.dart";

abstract interface class DialRepo {
  Future<Either<AppError, List<Contact>>> retrieveAllContacts();

  Future<Either<AppError, bool>> insertContact({
    required Contact contact,
  });

  Future<Either<AppError, bool>> updateContact({
    required Contact contact,
  });

  Future<Either<AppError, bool>> deleteContact({
    required Contact contact,
  });

  Future<Either<AppError, bool>> dialPhone({
    required String number,
  });

  Future<Either<AppError, bool>> sendSms({
    required String number,
    required String message,
  });
}
