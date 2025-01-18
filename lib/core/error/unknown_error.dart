

import 'package:flutter_appwrite_task/core/error/base_error.dart';

class UnknownError extends BaseError {
  const UnknownError();

  @override
  String toString() {
    return "Unknown error happened";
  }

}
