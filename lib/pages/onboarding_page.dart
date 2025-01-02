import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/models/onboarding_model.dart';
import 'package:lady_driver/pages/onboarding3_page.dart';
import 'package:lady_driver/widgets/onboarding/dot.dart';

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
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      const SizedBox(height: 13),
                      //! Skip
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return const Onboarding3Page();
                            }),
                          );
                        },
                        child: SizedBox(
                          width: double.infinity,
                          child: Text(
                            textAlign: TextAlign.start,
                            listOnBoarding[index].skip ?? '',
                            style: textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 74),
                      //! image
                      Image.asset(
                        height: 285,
                        width: 285,
                        listOnBoarding[index].image,
                      ),
                      const SizedBox(height: 89),
                      //! text
                      Text(
                        listOnBoarding[index].text,
                        style: textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 24),
                      //! labalText
                      Text(
                        textAlign: TextAlign.center,
                        listOnBoarding[index].lableText,
                        style: textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
              //! Dot
              Dot(
                currentindex: currentindex,
              ),
              const SizedBox(height: 90),
              //! CustomBottonNavigator
              GestureDetector(
                onTap: () {
                  if (currentindex == listOnBoarding.length - 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const Onboarding3Page();
                      }),
                    );
                  }
                  _controller.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 700),
                    curve: Curves.ease,
                  );
                },
                child: const CustomBotton(
                  borderColor: ColorManger.kPrimaryColor,
                  textThemeColor: ColorManger.kWhite,
                  color: ColorManger.kPrimaryColor,
                  text: 'التالي',
                ),
              ),
              const SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
