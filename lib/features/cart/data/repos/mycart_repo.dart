import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';

abstract class MyCartRepo {
  Future<Either<AppFailure, Map>> removeItem(
    String userID,
    String itemID,
  );

  Future<Either<AppFailure, Map>> addItem(
    String userID,
    String itemID,
  );
}
