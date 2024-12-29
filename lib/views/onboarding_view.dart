import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/constant/const_manager.dart';
import 'package:lady_driver/models/onboarding_model.dart';
import 'package:lady_driver/views/onboarding_3.dart';
import 'package:lady_driver/widgets/onboarding/dot.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
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
        child: Column(
          children: [
            Expanded(
                //! PageView
                child: PageView.builder(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  log(value.toString());
                  currentindex = value;
                });
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
                          return const Onboarding3();
                        }),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 16),
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
                  const SizedBox(height: 96),
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
                    listOnBoarding[index].lableText,
                    style: textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            )),

            //! Dot
            Dot(
              currentindex: currentindex,
            ),
            const SizedBox(height: 105),
            //! CustomBottonNavigator
            GestureDetector(
              onTap: () {
                if (currentindex == listOnBoarding.length - 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const Onboarding3();
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
                colorTextTheme: kWhite,
                color: kPrimaryColor,
                text: 'التالي',
              ),
            ),
            const SizedBox(height: 64),
          ],
        ),
      ),
    );
  }
}
