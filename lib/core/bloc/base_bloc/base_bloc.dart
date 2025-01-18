import 'package:flutter/material.dart';
import 'package:flutter_appwrite_task/core/error/base_error.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'base_state.dart';

class BaseBloc<T> extends Cubit<BaseState<T>> {
  BaseBloc([T? data])
      : super(data != null ? BaseState.success(data) : const BaseState.init());

  T? _data;

  T? get data => _data;

  set data(T? value) {
    _data = value;
  }

  void loadingState() {
    emit(const BaseState.loading());
  }

  void successState([T? data]) {
    if (_data != data) {
      _data = data;
    }
    emit(BaseState.success(data));
  }

  void failedState(
    BaseError error,
    VoidCallback callback,
  ) {
    emit(BaseState.failure(error, callback));
  }
}
