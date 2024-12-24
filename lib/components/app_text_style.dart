import 'package:flutter/material.dart';
import 'package:lady_driver/components/app_color.dart';

abstract class AppTextStyle {
  static const text64 = TextStyle(
    fontSize: 64,
    fontFamily: 'Judson-Bold',
    color: AppColor.kMaterialColor,
  );
  static const text32 = TextStyle(
    fontSize: 32,
    fontFamily: 'Judson-Regular',
    color: AppColor.kMaterialColor,
  );
}
