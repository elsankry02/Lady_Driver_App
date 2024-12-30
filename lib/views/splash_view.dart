import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/core/constant/string_manager.dart';
import 'package:lady_driver/core/constant/svg_manger.dart';
import 'package:lady_driver/views/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    splashToOnbording();
    super.initState();
  }

  splashToOnbording() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const OnboardingView(),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    splashToOnbording();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! image
            SvgPicture.asset(SvgManger.kLogo),
            const SizedBox(
              height: 16,
            ),
            //! text
            Text(
              'LadyDriver',
              style: textTheme.displayLarge!.copyWith(
                fontFamily: kJudson,
                fontWeight: FontWeight.w700,
                color: ColorManger.kPrimaryColor,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            //! lableText
            Text(
              'Your Comfort Zone',
              style: textTheme.headlineLarge!.copyWith(
                fontFamily: kJudson,
                fontWeight: FontWeight.w400,
                color: ColorManger.kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
