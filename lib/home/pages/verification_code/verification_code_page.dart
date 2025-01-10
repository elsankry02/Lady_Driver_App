import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:pinput/pinput.dart';

@RoutePage()
class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final pinputController = TextEditingController();
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
      body: Form(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(
              height: 24,
            ),
            Text(
                textAlign: TextAlign.center,
                'ادخل الرمز الذي تم إرساله إلي عنولن البريد \nالالكترونى',
                style: textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w500)),
            const SizedBox(height: 7),
            Text(
              textAlign: TextAlign.center,
              'be*****@gmail.com',
              style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorManger.kPrimaryColor),
            ),
            Pinput(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return 'valid';
                } else {
                  return 'this field cannot be empty';
                }
              },
              controller: pinputController,
              autofocus: true,
            )
          ],
        ),
      ),
    );
  }
}
