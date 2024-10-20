import 'package:flutter/material.dart';

SnackBar appSnackBarWearing(
    {required String message, required BuildContext context}) {
  return SnackBar(
    backgroundColor: Colors.deepOrangeAccent,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.horizontal,
    content: Text(
      message,
      style: Theme.of(context).textTheme.labelMedium,
    ),
  );
}
