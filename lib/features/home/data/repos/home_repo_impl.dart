import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/functions/fold_results.dart';
import 'package:ecommerce_app/core/services/api_service.dart';
import 'package:ecommerce_app/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<AppFailure, Map>> fetchAllData(String userID) async {
    final results = await apiService.post(
      AppServerLinks.home,
      {
        "userID": userID,
      },
    );

    return foldMethod(results);
  }

  @override
  Future<Either<AppFailure, Map>> fetchItemsBy(
    String userID,
    String categoryID,
  ) async {
    final results = await apiService.post(
      AppServerLinks.itemsPage,
      {
        "userID": userID,
        "categoryID": categoryID,
      },
    );

    return foldMethod(results);
  }
}
