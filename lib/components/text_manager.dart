import 'package:flutter/material.dart';
import 'package:lady_driver/components/color_manager.dart';

abstract class TextManager {
  static const kTextStyle64 = TextStyle(
    fontSize: 64,
    fontFamily: 'Judson-Bold',
    color: ColorManager.kMaterialColor,
  );
  static const kTextStyle32 = TextStyle(
    fontSize: 32,
    fontFamily: 'Judson-Regular',
    color: ColorManager.kMaterialColor,
  );
}
