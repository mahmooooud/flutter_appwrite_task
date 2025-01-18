import 'package:flutter_appwrite_task/core/error/base_error.dart';


class TimeoutError extends BaseError {
  const TimeoutError();

  @override
  String toString() {
    return "Please, reload page and resend request";
  }
}
