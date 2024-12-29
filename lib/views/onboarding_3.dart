import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/constant/const_manager.dart';

class Onboarding3 extends StatelessWidget {
  const Onboarding3({super.key});

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
                'assets/image/car_6.png',
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
            //! Log-in
            const CustomBotton(
              borderColor: kPrimaryColor,
              textThemeColor: kWhite,
              text: 'تسجيل الدخول كعميل',
              color: kPrimaryColor,
            ),
            const SizedBox(
              height: 24,
            ),
            //! Join
            Container(
              height: 48,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1.5,
                  color: kPrimaryColor,
                ),
                borderRadius: BorderRadius.circular(28),
                color: kWhite,
              ),
              child: Center(
                child: Text(
                  'إنضمي كسائقة',
                  style: textTheme.titleMedium!.copyWith(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
