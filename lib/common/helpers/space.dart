import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Space {
  Space._();
  static final Space instance = Space._();
  factory Space() => instance;
  static SizedBox verticalSpace(double height) {
    return SizedBox(height: height.h);
  }

  static SizedBox horizotalSpace(double width) {
    return SizedBox(width: width.w);
  }
}
