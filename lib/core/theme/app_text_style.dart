import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextTheme extends TextTheme {
  @override
  TextStyle? titleLarge = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w800,
      color: Colors.black);

  @override
  TextStyle? titleMedium = TextStyle(
      fontSize: 22.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black);
  @override
  TextStyle? titleSmall = TextStyle(
      fontSize: 20.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black);

  @override
  TextStyle? bodyLarge = TextStyle(
    fontSize: 18.sp,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
  @override
  TextStyle? bodyMedium = TextStyle(
    fontSize: 16.sp,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
  @override
  TextStyle? bodySmall = TextStyle(
    fontSize: 14.sp,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );

  @override
  TextStyle? displaySmall = TextStyle(
    fontSize: 12.sp,
    color: Colors.black,
    fontWeight: FontWeight.w400,
  );
}
