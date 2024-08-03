import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  TextTheme get textTheme => Theme.of(this).textTheme;

  void showSnackBar(final String message) {
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message)));
  }
}
