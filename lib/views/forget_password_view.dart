import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/components/custom_textformfield.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/core/constant/image_manger.dart';
import 'package:lady_driver/core/constant/svg_manger.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        //! نسيت كلمة المرور
        title: Text(
          'نسيت كلمة المرور',
          style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 20),
          Image.asset(
            width: 254,
            height: 254,
            ImageManger.kForgetpassword,
          ),
          const SizedBox(height: 20),
          //! ادخل بريدك الالكتروني
          Text(
            'ادخل بريدك الالكتروني',
            textAlign: TextAlign.end,
            style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 30),

          CustomTextFormField(
            controller: emailController,
            suffixIcon: SvgManger.kMail,
            hintText: 'البريد الالكترونى',
          ),
          const SizedBox(height: 30),
          //! إرسال الرمز
          const CustomBotton(
              text: 'إرسال الرمز',
              color: ColorManger.kPrimaryColor,
              textThemeColor: ColorManger.kWhite,
              borderColor: ColorManger.kPrimaryColor)
        ],
      ),
    );
  }
}
