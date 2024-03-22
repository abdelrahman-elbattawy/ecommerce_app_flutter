enum StatusFailure {
  failure,
  serverFailure,
  offlineFailure,
}

abstract class Failure {
  final String errMessage;
  final StatusFailure statusFailure;

  const Failure(
    this.errMessage,
    this.statusFailure,
  );
}
