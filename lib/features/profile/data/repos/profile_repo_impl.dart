import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/functions/fold_results.dart';
import 'package:ecommerce_app/core/services/api_service.dart';
import 'package:ecommerce_app/features/profile/data/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService apiService;

  ProfileRepoImpl({required this.apiService});

  @override
  Future<Either<AppFailure, Map>> deleteAccountBy(String email) async {
    final results = await apiService.post(
      AppServerLinks.deleteAccount,
      {"email": email},
    );

    return foldMethod(results);
  }

  @override
  Future<Either<AppFailure, Map>> uploadAvatarBy(
    String email,
    File fileImage,
  ) async {
    final results = await apiService.uploadImage(
      AppServerLinks.uploadAvatar,
      email,
      fileImage,
    );

    return foldMethod(results);
  }

  @override
  Future<Either<AppFailure, Map>> updateAccountInfo(
    String email,
    String imageName,
    String phone,
    String userName,
  ) async {
    final results = await apiService.post(
      AppServerLinks.updateAccountInfo,
      {
        "username": userName,
        "email": email,
        "phone": phone,
        "imageName": imageName,
        "folder": "users"
      },
    );

    return foldMethod(results);
  }

  @override
  Future<Either<AppFailure, Map>> updatePasswordBy(
    String email,
    String oldPassword,
    String newPassword,
  ) async {
    final results = await apiService.post(
      AppServerLinks.updatePassword,
      {
        "email": email,
        "oldPassword": oldPassword,
        "newPassword": newPassword,
      },
    );

    return foldMethod(results);
  }
}
