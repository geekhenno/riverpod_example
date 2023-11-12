import 'package:flutter/material.dart';

class UiHelper {
  static void showLoaderDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: Colors.black26,
      builder: (BuildContext context) {
        return const AlertDialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          content: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }

  const UiHelper._();
}
