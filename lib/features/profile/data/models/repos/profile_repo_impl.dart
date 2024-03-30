import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/functions/fold_results.dart';
import 'package:ecommerce_app/core/services/api_service.dart';
import 'package:ecommerce_app/features/profile/data/models/repos/profile_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiService apiService;

  ProfileRepoImpl({required this.apiService});

  @override
  Future<Either<AppFailure, Map>> deleteAccountBy(String email) async {
    final results =
        await apiService.post(AppServerLinks.deleteAccount, {"email": email});

    return foldMethod(results);
  }
}
