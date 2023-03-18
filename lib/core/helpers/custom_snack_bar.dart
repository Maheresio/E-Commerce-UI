import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, String errorMsg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(errorMsg),
    ),
  );
}
