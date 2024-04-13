import "package:dial_verse/core/resources/usecase.dart";
import "package:dial_verse/domain/entities/dv_contact_entity.dart";
import "package:dial_verse/domain/repo/dial_repo.dart";
import "package:fpdart/fpdart.dart";

import "../../core/resources/app_error.dart";

class RetrieveAllContacts implements Usecase<List<DVContactEntity>, Noparams> {
  final DialRepo _dialRepo;
  const RetrieveAllContacts({required DialRepo repo}) : _dialRepo = repo;

  @override
  Future<Either<AppError, List<DVContactEntity>>> call({
    required Noparams params,
  }) async =>
      await _dialRepo.retrieveAllContacts();
}
