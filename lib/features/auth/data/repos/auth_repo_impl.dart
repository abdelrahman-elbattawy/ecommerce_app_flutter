import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
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

    return results.fold(
      (failure) => left(failure),
      (data) {
        if (data['status'] == 'success') {
          return right(data);
        } else {
          return left(
            AppFailure(
              data['message'],
              StatusFailure.failure,
            ),
          );
        }
      },
    );
  }
}
