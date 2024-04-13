import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/functions/fold_results.dart';
import 'package:ecommerce_app/core/services/api_service.dart';
import 'package:ecommerce_app/features/cart/data/repos/mycart_repo.dart';

class MyCartRepoImpl implements MyCartRepo {
  final ApiService apiService;

  MyCartRepoImpl({required this.apiService});

  @override
  Future<Either<AppFailure, Map>> removeItem(
    String userID,
    String itemID,
  ) async {
    final results = await apiService.post(
      AppServerLinks.removeCart,
      {
        "userID": userID,
        "itemID": itemID,
      },
    );

    return foldMethod(results);
  }

  @override
  Future<Either<AppFailure, Map>> addItem(
    String userID,
    String itemID,
  ) async {
    final results = await apiService.post(
      AppServerLinks.addCart,
      {
        "userID": userID,
        "itemID": itemID,
      },
    );

    return foldMethod(results);
  }
}
