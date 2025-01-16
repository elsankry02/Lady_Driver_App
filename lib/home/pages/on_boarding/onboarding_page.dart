import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/cached/cached_helper.dart';
import '../../../core/components/custom_botton.dart';
import '../../../core/constant/color_manger.dart';
import '../../../core/models/onboarding_model.dart';
import '../../../core/router/router.dart';
import '../../../l10n/app_localizations.dart';
import 'widget/dot.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int currentindex = 0;
  final _controller = PageController(initialPage: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: Column(
            children: [
              Expanded(
                //! PageView
                child: PageView.builder(
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(
                      () {
                        currentindex = value;
                      },
                    );
                  },
                  itemCount: listOnBoarding.length,
                  itemBuilder: (context, index) => Column(
                    children: [
                      SizedBox(height: mediaQueryHeight * 0.013),
                      //! Skip
                      GestureDetector(
                        onTap: () {
                          CachedHelper.setBool(key: 'SavedData', value: true);
                          context.router.replace(const WelcomeRoute());
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            AppLocalizations.of(context)!.skip,
                            style: textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: mediaQueryHeight * 0.074),

                      //! image
                      Image.asset(
                        height: mediaQueryHeight * 0.285,
                        width: mediaQueryWidth,
                        listOnBoarding[index].image,
                      ),
                      SizedBox(height: mediaQueryHeight * 0.090),
                      //! text
                      Text(
                        listOnBoarding[index].text,
                        style: textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: mediaQueryHeight * 0.024),
                      //! labalText
                      Text(
                        textAlign: TextAlign.center,
                        listOnBoarding[index].lableText,
                        style: textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: mediaQueryHeight * 0.024),
                    ],
                  ),
                ),
              ),
              //! Dot
              Dot(
                currentindex: currentindex,
              ),
              SizedBox(height: mediaQueryHeight * 0.090),

              //! CustomBottonNavigator
              GestureDetector(
                onTap: () {
                  CachedHelper.setBool(key: 'SavedData', value: true);
                  if (currentindex == listOnBoarding.length - 1) {
                    context.router.replaceAll(
                      [const WelcomeRoute()],
                    );
                  }
                  _controller.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.ease,
                  );
                },
                child: CustomBotton(
                  borderColor: ColorManger.kPrimaryColor,
                  textThemeColor: ColorManger.kWhite,
                  color: ColorManger.kPrimaryColor,
                  text: AppLocalizations.of(context)!.next,
                ),
              ),
              SizedBox(height: mediaQueryHeight * 0.064),
            ],
          ),
        ),
      ),
    );
  }
}
