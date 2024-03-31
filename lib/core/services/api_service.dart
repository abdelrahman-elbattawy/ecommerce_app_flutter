import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/errors/app_failure.dart';
import 'package:ecommerce_app/core/errors/failure.dart';
import 'package:ecommerce_app/core/functions/check_internet_func.dart';
import 'package:http/http.dart' as http;

import 'package:path/path.dart';
import 'package:async/async.dart';

class ApiService {
  Future<Either<AppFailure, Map>> uploadImage(
    String endPoint,
    String email,
    File fileImage,
  ) async {
    try {
      if (await checkInternet()) {
        final stream = http.ByteStream(DelegatingStream(fileImage.openRead()));
        final length = await fileImage.length();
        final uri = Uri.parse(endPoint);
        final request = http.MultipartRequest("POST", uri);
        final multipartFileSign = http.MultipartFile(
            'profile_pic', stream, length,
            filename: basename(fileImage.path));
        request.files.add(multipartFileSign);
        request.fields["email"] = email;
        request.fields["foldar"] = "users";
        final response = await request.send();

        if (response.statusCode == 200) {
          final respStr = await response.stream.bytesToString();

          return right(jsonDecode(respStr));
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

  Future<Either<AppFailure, Map>> post(String endPoint, [Map? body]) async {
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
