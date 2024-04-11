import "package:dial_verse/core/resources/app_error.dart";
import "package:dial_verse/core/resources/usecase.dart";
import "package:fpdart/fpdart.dart";

import "../repo/dial_repo.dart";
import "insert_contact.dart";

class UpdateContact implements Usecase<void, ContactParams> {
  final DialRepo _dialRepo;
  const UpdateContact({required DialRepo repo}) : _dialRepo = repo;

  @override
  Future<Either<AppError, void>> call({required ContactParams params}) async =>
      await _dialRepo.updateContact(contact: params.contact);
}
