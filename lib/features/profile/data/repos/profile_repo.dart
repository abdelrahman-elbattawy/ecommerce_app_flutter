import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';

abstract class ProfileRepo {
  Future<Either<AppFailure, Map>> deleteAccountBy(String email);
  Future<Either<AppFailure, Map>> uploadAvatarBy(String email, File fileImage);
  Future<Either<AppFailure, Map>> updateAccountInfo(
    String email,
    String imageName,
    String phone,
    String userName,
  );
  Future<Either<AppFailure, Map>> updatePasswordBy(
    String email,
    String oldPassword,
    String newPassword,
  );
}
