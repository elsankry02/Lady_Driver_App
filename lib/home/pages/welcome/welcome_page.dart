import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/core/constant/image_manger.dart';
import 'package:lady_driver/core/router/router.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 150,
            ),
            //! Image
            Center(
              child: Image.asset(
                width: 285,
                height: 285,
                ImageManger.kOndoarding3,
              ),
            ),
            const SizedBox(
              height: 121,
            ),
            Text(
              '👋 أهلا بك',
              style: textTheme.headlineLarge!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            //! تسجيل الدخول
            GestureDetector(
              onTap: () => context.router.replaceAll([const LoginRoute()]),
              child: const CustomBotton(
                borderColor: ColorManger.kPrimaryColor,
                textThemeColor: ColorManger.kWhite,
                text: 'تسجيل الدخول ',
                color: ColorManger.kPrimaryColor,
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            //!  انشاء حساب
            GestureDetector(
              onTap: () =>
                  context.router.replaceAll([const CreateAnAccountRoute()]),
              child: const CustomBotton(
                text: 'انشاء حساب',
                textThemeColor: ColorManger.kPrimaryColor,
                borderColor: ColorManger.kPrimaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
