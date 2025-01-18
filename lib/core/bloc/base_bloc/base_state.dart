import 'package:flutter/material.dart';
import 'package:flutter_appwrite_task/core/error/base_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'base_state.freezed.dart';

@immutable
@freezed
class BaseState<T> with _$BaseState<T> {
  const factory BaseState.init() = _Init;

  const factory BaseState.loading() = _Loading;

  const factory BaseState.success([T? model]) = _Success<T>;

  const factory BaseState.failure(BaseError error, VoidCallback callback) = _Failure;
}
