import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/errors/failure.dart';

FutureOr<Either<AppFailure, Map<dynamic, dynamic>>> foldMethod(
  Either<AppFailure, Map<dynamic, dynamic>> results,
) {
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
