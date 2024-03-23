import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';

abstract class AuthRepo {
  Future<Either<AppFailure, Map>> registerWithData(
    String userName,
    String password,
    String email,
    String phone,
  );

  Future<Either<AppFailure, Map>> loginWithData(
    String email,
    String password,
  );

  Future<Either<AppFailure, Map>> checkVerifyCodeWith(
    String email,
    String verifyCode,
  );

  Future<Either<AppFailure, Map>> forgotPassowdWith(
    String email,
  );

  Future<Either<AppFailure, Map>> checkVerifyCodePasswordWith(
    String email,
    String verifyCode,
  );

  Future<Either<AppFailure, Map>> resetPasswordWith(
    String email,
    String password,
  );
}
