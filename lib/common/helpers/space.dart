import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

abstract class Space {

  static SizedBox verticalSpace(double height) {
    return SizedBox(height: height.h);
  }

  static SizedBox horizotalSpace(double width) {
    return SizedBox(width: width.w);
  }
}
