import 'package:flutter/material.dart';

class Space {
  Space._();
  static final Space instance = Space._();
  factory Space() => instance;
  static SizedBox verticalSpace(double height) {
    return SizedBox(height: height);
  }

  static SizedBox horizotalSpace(double width) {
    return SizedBox(width: width);
  }
}
