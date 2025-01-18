import 'package:flutter/material.dart';
import 'package:flutter_appwrite_task/core/error/bad_request_error.dart';
import 'package:flutter_appwrite_task/core/ui/page_error_view.dart';
import '../bloc/base_bloc/base_state.dart';

class ShowErrorWidget extends StatelessWidget {
  final BaseState state;

  const ShowErrorWidget({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return state.maybeWhen(orElse: () {
      return Container();
    }, failure: (error, callback) {
      // Connection Error
       if (error is BadRequestError) {
        return PageErrorView(
          action: callback,
          actionName: 'TryAgain',
          errorMessage: error.toString(),
        );
      }
      return PageErrorView(
        action: callback,
        actionName: "AN UNEXPECTED ERROR OCCURRED",
        errorMessage: error.toString(),
      );
    });
  }
}

class UnauthorizedErrorScreenWidget extends StatelessWidget {
  const UnauthorizedErrorScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: const SizedBox(),
      ),
    );
  }
}
