import "package:dial_verse/core/resources/usecase.dart";
import "package:dial_verse/domain/repo/dial_repo.dart";
import "package:flutter_contacts/flutter_contacts.dart";
import "package:fpdart/fpdart.dart";

import "../../core/resources/app_error.dart";

class RetrieveAllContacts implements Usecase<List<Contact>, Noparams> {
  final DialRepo _dialRepo;
  const RetrieveAllContacts({required DialRepo repo}) : _dialRepo = repo;

  @override
  Future<Either<AppError, List<Contact>>> call({
    required Noparams params,
  }) async {
    print("usecase");
    return await _dialRepo.retrieveAllContacts();
  }
}
