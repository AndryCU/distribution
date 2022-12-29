import 'package:flutter/material.dart';

import '../main_ui/pages/main_page.dart';

InputDecoration textFieldDecoration({required String hintText}) {
  return InputDecoration(
    labelText: hintText,
    border: const OutlineInputBorder(),
    contentPadding: const EdgeInsets.only(right: 15, left: 15),
  );
}

void showSnackBar({
  required String message,
  required Color color,
  required int seconds,
}) {
  ScaffoldMessenger.of(scaffoldKey.currentContext!)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12.0))),
          child: Text(message),
        ),
        backgroundColor: color,
        duration: Duration(seconds: seconds),
        behavior: SnackBarBehavior.floating,
      ),
    );
}
