import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';

abstract class SearchRepo {
  Future<Either<AppFailure, Map>> fetchItemsBy(
    String searchWord,
  );
}
