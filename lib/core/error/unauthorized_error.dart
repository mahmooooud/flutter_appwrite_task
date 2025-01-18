import 'package:flutter_appwrite_task/core/error/base_error.dart';

class UnauthorizedError extends BaseError {
  const UnauthorizedError();

  @override
  String toString() {
    return "UNAUTHORIZED";
  }
}
