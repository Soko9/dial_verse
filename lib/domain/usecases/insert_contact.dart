import "package:dial_verse/core/resources/app_error.dart";
import "package:dial_verse/core/resources/usecase.dart";
import "package:flutter_contacts/flutter_contacts.dart";
import "package:fpdart/fpdart.dart";

import "../repo/dial_repo.dart";

class ContactParams {
  final Contact contact;
  const ContactParams({required this.contact});
}

class InsertContact implements Usecase<void, ContactParams> {
  final DialRepo _dialRepo;
  const InsertContact({required DialRepo repo}) : _dialRepo = repo;

  @override
  Future<Either<AppError, void>> call({required ContactParams params}) async {
    print("usecase");
    return await _dialRepo.insertContact(contact: params.contact);
  }
}