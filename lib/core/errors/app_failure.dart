import 'package:ecommerce_app/core/errors/failure.dart';

class AppFailure extends Failure {
  AppFailure(super.errMessage, super.statusFailure);

  factory AppFailure.fromStatusFailure(StatusFailure statusFailure) {
    if (statusFailure == StatusFailure.offlineFailure) {
      return AppFailure(
        'Check your internet, Please try again',
        statusFailure,
      );
    } else {
      return AppFailure(
        'Opps There was an Error, Please try again',
        statusFailure,
      );
    }
  }

  factory AppFailure.fromResponse(dynamic response) {
    if (response.statusCode == 400 ||
        response.statusCode == 401 ||
        response.statusCode == 403) {
      return AppFailure(
        response['status']['message'],
        StatusFailure.serverFailure,
      );
    } else if (response.statusCode == 404) {
      return AppFailure(
        'Your request not found, Please try later!',
        StatusFailure.serverFailure,
      );
    } else if (response.statusCode == 500) {
      return AppFailure(
        'Internal Server error, Please try later',
        StatusFailure.serverFailure,
      );
    } else {
      return AppFailure(
        'Opps There was an Error, Please try again',
        StatusFailure.serverFailure,
      );
    }
  }
}
