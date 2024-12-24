import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lady_driver/components/app_text_style.dart';
import 'package:lady_driver/views/onboarding/onboarding_view.dart';

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
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const OnboardingView(),
        ),
      );
    });
  }

  @override
  void dispose() {
    splashToOnbording();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/logo.svg'),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'LadyDriver',
              style: AppTextStyle.text64,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Your Comfort Zone',
              style: AppTextStyle.text32,
            ),
          ],
        ),
      ),
    );
  }
}
