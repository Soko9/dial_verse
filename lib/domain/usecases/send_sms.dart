import "package:dial_verse/core/resources/app_error.dart";
import "package:dial_verse/core/resources/usecase.dart";
import "package:fpdart/fpdart.dart";

import "../repo/dial_repo.dart";

class SmsParams {
  final String number;
  final String message;

  const SmsParams({
    required this.number,
    required this.message,
  });
}

class SendSms implements Usecase<bool, SmsParams> {
  final DialRepo _dialRepo;
  const SendSms({required DialRepo repo}) : _dialRepo = repo;

  @override
  Future<Either<AppError, bool>> call({required SmsParams params}) async =>
      await _dialRepo.sendSms(
        number: params.number,
        message: params.message,
      );
}
