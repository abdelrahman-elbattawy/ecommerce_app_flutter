import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/functions/fold_results.dart';
import 'package:ecommerce_app/core/services/api_service.dart';
import 'package:ecommerce_app/features/auth/data/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiService apiService;

  AuthRepoImpl({required this.apiService});

  @override
  Future<Either<AppFailure, Map>> registerWithData(
    String userName,
    String password,
    String email,
    String phone,
  ) async {
    final results = await apiService.post(
      AppServerLinks.register,
      {
        "username": userName,
        "email": email,
        "password": password,
        "phone": phone,
      },
    );

    return foldMethod(results);
  }

  @override
  Future<Either<AppFailure, Map>> loginWithData(
    String email,
    String password,
  ) async {
    final results = await apiService.post(
      AppServerLinks.login,
      {
        "email": email,
        "password": password,
      },
    );

    return foldMethod(results);
  }

  @override
  Future<Either<AppFailure, Map>> checkVerifyCodeWith(
    String email,
    String verifyCode,
  ) async {
    final results = await apiService.post(
      AppServerLinks.verifyCode,
      {
        "email": email,
        "verifycode": verifyCode,
      },
    );

    return foldMethod(results);
  }

  @override
  Future<Either<AppFailure, Map>> forgotPassowdWith(String email) async {
    final results = await apiService.post(
      AppServerLinks.forgotPassword,
      {
        "email": email,
      },
    );

    return foldMethod(results);
  }

  @override
  Future<Either<AppFailure, Map>> checkVerifyCodePasswordWith(
    String email,
    String verifyCode,
  ) async {
    final results = await apiService.post(
      AppServerLinks.verifyCodePassowrd,
      {
        "email": email,
        "verifycode": verifyCode,
      },
    );

    return foldMethod(results);
  }

  @override
  Future<Either<AppFailure, Map>> resetPasswordWith(
    String email,
    String password,
  ) async {
    final results = await apiService.post(
      AppServerLinks.resetPassowrd,
      {
        "email": email,
        "password": password,
      },
    );

    return foldMethod(results);
  }
}
