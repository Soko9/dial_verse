import "package:dial_verse/core/resources/app_error.dart";
import "package:dial_verse/domain/entities/dv_contact_entity.dart";
import "package:fpdart/fpdart.dart";

abstract interface class DialRepo {
  Future<Either<AppError, List<DVContactEntity>>> retrieveAllContacts();

  Future<Either<AppError, bool>> insertContact({
    required DVContactEntity contact,
  });

  Future<Either<AppError, bool>> updateContact({
    required DVContactEntity contact,
  });

  Future<Either<AppError, bool>> deleteContact({
    required DVContactEntity contact,
  });

  Future<Either<AppError, bool>> dialPhone({
    required String number,
  });

  Future<Either<AppError, bool>> sendSms({
    required String number,
    required String message,
  });
}
