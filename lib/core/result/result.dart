import 'package:flutter_appwrite_task/core/error/base_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'result.freezed.dart';

@freezed
class MyResult<T> with _$MyResult<T> {
  const factory MyResult.isSuccess([T? model]) = IsSuccess<T>;

  const factory MyResult.isError(BaseError error) = IsError;
}
