import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/core/router/router.dart';

@RoutePage()
class CustomIconChangeLanguagePage extends StatelessWidget {
  const CustomIconChangeLanguagePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.router.push(const ChangeLanguageRoute());
      },
      icon: const Icon(
        Icons.language,
        color: ColorManger.kPrimaryColor,
      ),
    );
  }
}
