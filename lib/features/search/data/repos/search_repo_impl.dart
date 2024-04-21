import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/constants/app_server_links.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/functions/fold_results.dart';
import 'package:ecommerce_app/core/services/api_service.dart';
import 'package:ecommerce_app/features/search/data/repos/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl({required this.apiService});

  @override
  Future<Either<AppFailure, Map>> fetchItemsBy(
    String searchWord,
  ) async {
    final results = await apiService.post(
      AppServerLinks.searchPage,
      {
        "searchWord": searchWord,
      },
    );

    return foldMethod(results);
  }
}
