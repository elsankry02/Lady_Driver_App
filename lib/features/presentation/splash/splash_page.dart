import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/cached/cached_helper.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_svgs.dart';
import '../../../core/constant/endpoint.dart';
import '../../../core/router/router.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    splashToOnbording();
    super.initState();
  }

  splashToOnbording() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        final isSaved = CachedHelper.getBool(key: 'SavedData') ?? false;
        if (isSaved) {
          //!  True في حاله ال
          context.router.replace(const WelcomeRoute());
        } else {
          //!  False في حاله ال
          context.router.replace(const OnboardingRoute());
        }
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
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //! image
            SvgPicture.asset(AppSvgs.kLogo),
            SizedBox(height: mediaQueryHeight * 0.016),
            //! text
            Text(
              'LadyDriver',
              style: textTheme.displayLarge!.copyWith(
                fontFamily: kJudson,
                fontWeight: FontWeight.w700,
                color: AppColors.kPrimaryColor,
              ),
            ),
            SizedBox(height: mediaQueryHeight * 0.016),
            //! lableText
            Text(
              'Your Comfort Zone',
              style: textTheme.headlineLarge!.copyWith(
                fontFamily: kJudson,
                fontWeight: FontWeight.w400,
                color: AppColors.kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
