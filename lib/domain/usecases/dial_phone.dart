import "package:dial_verse/core/resources/app_error.dart";
import "package:dial_verse/core/resources/usecase.dart";
import "package:fpdart/fpdart.dart";

import "../repo/dial_repo.dart";

class DialPhone implements Usecase<void, String> {
  final DialRepo _dialRepo;
  const DialPhone({required DialRepo repo}) : _dialRepo = repo;

  @override
  Future<Either<AppError, void>> call({required String params}) async =>
      await _dialRepo.dialPhone(number: params);
}
