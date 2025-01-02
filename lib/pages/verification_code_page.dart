import 'package:flutter/material.dart';
import 'package:lady_driver/core/constant/color_manger.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'رمز التحقق',
          style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(
            height: 24,
          ),
          Text(
              textAlign: TextAlign.center,
              'ادخل الرمز الذي تم إرساله إلي عنولن البريد \nالالكترونى',
              style:
                  textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500)),
          const SizedBox(height: 7),
          Text(
            textAlign: TextAlign.center,
            'be*****@gmail.com',
            style: textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w500, color: ColorManger.kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
