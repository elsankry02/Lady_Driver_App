import 'package:flutter/material.dart';
import 'package:lady_driver/core/constant/const_manager.dart';
import 'package:lady_driver/models/onboarding_model.dart';

class Dot extends StatelessWidget {
  const Dot({super.key, required this.currentindex});
  final int currentindex;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
          listOnBoarding.length,
          (index) => Container(
            margin: const EdgeInsets.only(right: 5),
            height: 7,
            width: currentindex == index ? 20 : 7,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ],
    );
  }
}
