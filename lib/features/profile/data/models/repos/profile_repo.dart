import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';

abstract class ProfileRepo {
  Future<Either<AppFailure, Map>> deleteAccountBy(String email);
}
