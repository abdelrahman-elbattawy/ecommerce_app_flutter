import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';

abstract class HomeRepo {
  Future<Either<AppFailure, Map>> fetchAllData();
  Future<Either<AppFailure, Map>> fetchItemsBy(String categoryID);
}
