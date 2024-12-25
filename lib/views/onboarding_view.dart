import 'package:flutter/material.dart';
import 'package:lady_driver/models/onboarding_model.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: listOnBoarding.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      width: double.infinity,
                      child: Text(listOnBoarding[index].skip ?? '',
                          style: textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.start),
                    ),
                    const SizedBox(height: 74),
                    Image.asset(
                      height: 285,
                      width: 285,
                      listOnBoarding[index].image,
                    ),
                    const SizedBox(height: 96),
                    Text(
                      listOnBoarding[index].body,
                      style: textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      listOnBoarding[index].lable,
                      style: textTheme.titleSmall!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
