import "package:dial_verse/core/resources/app_error.dart";
import "package:dial_verse/core/resources/usecase.dart";
import "package:dial_verse/domain/entities/dv_contact_entity.dart";
import "package:fpdart/fpdart.dart";

import "../repo/dial_repo.dart";

class ContactParams {
  final DVContactEntity contact;
  const ContactParams({required this.contact});
}

class InsertContact implements Usecase<bool, ContactParams> {
  final DialRepo _dialRepo;
  const InsertContact({required DialRepo repo}) : _dialRepo = repo;

  @override
  Future<Either<AppError, bool>> call({required ContactParams params}) async =>
      await _dialRepo.insertContact(contact: params.contact);
}
