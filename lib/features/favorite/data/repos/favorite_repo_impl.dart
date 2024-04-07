import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/functions/fold_results.dart';
import 'package:ecommerce_app/core/services/api_service.dart';
import 'package:ecommerce_app/features/favorite/data/repos/favorite_repo.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final ApiService apiService;

  FavoriteRepoImpl({required this.apiService});

  @override
  Future<Either<AppFailure, Map>> removeFavorite(
    String userID,
    String itemID,
  ) async {
    final results = await apiService.post(
      AppServerLinks.removeFavorite,
      {
        "userID": userID,
        "itemID": itemID,
      },
    );

    return foldMethod(results);
  }

  @override
  Future<Either<AppFailure, Map>> addFavorite(
    String userID,
    String itemID,
  ) async {
    final results = await apiService.post(
      AppServerLinks.addFavorite,
      {
        "userID": userID,
        "itemID": itemID,
      },
    );

    return foldMethod(results);
  }

  @override
  Future<Either<AppFailure, Map>> viewFavorite(
    String userID,
  ) async {
    final results = await apiService.post(
      AppServerLinks.viewFavorite,
      {
        "userID": userID,
      },
    );

    return foldMethod(results);
  }
}
