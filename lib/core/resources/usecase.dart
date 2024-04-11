import "package:dial_verse/core/resources/app_error.dart";
import "package:fpdart/fpdart.dart";

abstract interface class Usecase<Type, Params> {
  Future<Either<AppError, Type>> call({required Params params});
}

class Noparams {}
