import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';

abstract class FavoriteRepo {
  Future<Either<AppFailure, Map>> removeFavorite(
    String userID,
    String itemID,
  );

  Future<Either<AppFailure, Map>> addFavorite(
    String userID,
    String itemID,
  );
}
