import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/constant/const_manager.dart';
import 'package:lady_driver/views/create_an_account.dart';

class Onboarding3View extends StatelessWidget {
  const Onboarding3View({super.key});

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
            //! Create an account
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CreateAnAccount();
                    },
                  ),
                );
              },
              child: const CustomBotton(
                  text: 'إنضمي كسائقة',
                  color: kWhite,
                  textThemeColor: kPrimaryColor,
                  borderColor: kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
