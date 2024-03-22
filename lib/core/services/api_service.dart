import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/functions/check_internet_func.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<Either<AppFailure, Map>> post(String endPoint, Map body) async {
    try {
      if (await checkInternet()) {
        final response = await http.post(Uri.parse(endPoint), body: body);

        if (response.statusCode == 200 || response.statusCode == 201) {
          final responseBody = jsonDecode(response.body);

          return right(responseBody);
        } else {
          return left(AppFailure.fromResponse(response));
        }
      } else {
        return left(
          AppFailure.fromStatusFailure(StatusFailure.offlineFailure),
        );
      }
    } catch (e) {
      return left(
        AppFailure.fromStatusFailure(StatusFailure.serverFailure),
      );
    }
  }
}
