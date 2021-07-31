import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message, {milliseconds = 3000}) {
  final snackBar = SnackBar(
    backgroundColor: Colors.deepOrange.withOpacity(0.8),
    duration: Duration(milliseconds: milliseconds),
    elevation: 4,
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
    ),
    action: SnackBarAction(
      label: 'OK',
      textColor: Colors.white,
      onPressed: () {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      },
    ),
  );

  // Find the ScaffoldMessenger in the widget tree
  // and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
