import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/core/ui_helper.dart';

extension WidgetRefEx on WidgetRef {
  customListen({
    required BuildContext context,
    required ProviderListenable provider,
    VoidCallback? onAsyncData,
    VoidCallback? onAsyncError,
    bool showSuccessfulMessage = true,
    bool showErrorMessage = true,
  }) {
    void onSuccess() {
      Navigator.pop(context);
      if (showSuccessfulMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Loaded Successfully'),
          ),
        );
      }
      onAsyncData?.call();
    }

    void onError() {
      Navigator.pop(context);
      if (showErrorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Loaded Failed'),
            backgroundColor: Colors.red,
          ),
        );
      }
      onAsyncError?.call();
    }

    listen(provider, (previous, state) {
      if (state is AsyncLoading) {
        UiHelper.showLoaderDialog(context);
      } else if (state is AsyncData) {
        onSuccess();
      } else if (state is AsyncError) {
        onError();
      }
    });
  }
}
