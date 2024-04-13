import "package:contacts_service/contacts_service.dart";
import "package:dial_verse/core/resources/app_error.dart";
import "package:dial_verse/data/sources/local/data_source.dart";
import "package:dial_verse/domain/repo/dial_repo.dart";
import "package:fpdart/fpdart.dart";

class IDialRepo implements DialRepo {
  final DataSource _dataSource;
  const IDialRepo({required DataSource source}) : _dataSource = source;

  @override
  Future<Either<AppError, List<Contact>>> retrieveAllContacts() async {
    try {
      print("repo");
      final result = await _dataSource.retrieveAllContacts();
      return right(result);
    } on AppError catch (e) {
      return left(AppError(message: e.message));
    }
  }

  @override
  Future<Either<AppError, bool>> insertContact({
    required Contact contact,
  }) async {
    print("repo");
    try {
      await _dataSource.insertContact(
        contact: contact,
      );
      return right(true);
    } on AppError catch (e) {
      return left(AppError(message: e.message));
    }
  }

  @override
  Future<Either<AppError, bool>> updateContact({
    required Contact contact,
  }) async {
    try {
      await _dataSource.updateContact(
        contact: contact,
      );
      return right(true);
    } on AppError catch (e) {
      return left(AppError(message: e.message));
    }
  }

  @override
  Future<Either<AppError, bool>> deleteContact({
    required Contact contact,
  }) async {
    try {
      await _dataSource.deleteContact(
        contact: contact,
      );
      return right(true);
    } on AppError catch (e) {
      return left(AppError(message: e.message));
    }
  }

  @override
  Future<Either<AppError, bool>> dialPhone({
    required String number,
  }) async {
    try {
      await _dataSource.dialPhone(number: number);
      return right(true);
    } on AppError catch (e) {
      return left(AppError(message: e.message));
    }
  }

  @override
  Future<Either<AppError, bool>> sendSms({
    required String number,
    required String message,
  }) async {
    try {
      await _dataSource.sendSms(message: message, number: number);
      return right(true);
    } on AppError catch (e) {
      return left(AppError(message: e.message));
    }
  }
}
