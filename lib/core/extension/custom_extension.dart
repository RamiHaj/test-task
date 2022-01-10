// ignore_for_file: invalid_use_of_protected_member
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension StateExt<T> on StateMixin<T> {
  Widget customObx(
      NotifierBuilder<T?> widget, {
        Widget Function(String? error)? onError,
        Widget? onLoading,
        Widget? onEmpty,
        Function? onRetryFunction,
      }) {
    return SimpleBuilder(builder: (_) {
      if (status.isLoading) {
        return Center(child: onLoading ?? const CircularProgressIndicator());
      } else if (status.isError) {
        return onError != null
            ? onError(status.errorMessage)
            : const Text('No Internet');
      } else if (status.isEmpty) {
        return onEmpty ??  const Text('Empty');
      }
      return widget(value);
    });
  }
}
