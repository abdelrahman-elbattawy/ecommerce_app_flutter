import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';

abstract class AuthRepo {
  Future<Either<AppFailure, Map>> registerWithData(
    String userName,
    String password,
    String email,
    String phone,
  );
}
