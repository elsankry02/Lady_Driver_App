import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../data/models/onboarding_model.dart';

class Dot extends StatelessWidget {
  const Dot({super.key, required this.currentindex});
  final int currentindex;
  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          listOnBoarding(context).length,
          (index) => Container(
            margin: const EdgeInsetsDirectional.only(start: 5),
            height: mediaQueryHeight * 0.010,
            width: currentindex == index
                ? mediaQueryWidth * 0.050
                : mediaQueryWidth * 0.020,
            decoration: BoxDecoration(
              color: AppColors.kPrimaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ],
    );
  }
}
