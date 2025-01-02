import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/components/custom_textformfield.dart';
import 'package:lady_driver/core/components/custom_textformfield_password.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/core/constant/svg_manger.dart';
import 'package:lady_driver/pages/verification_code_page.dart';
import 'package:lady_driver/widgets/rich_text/rich_text_login_widget.dart';
import 'package:lady_driver/widgets/rich_text/rich_text_privacy_policy_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formkey = GlobalKey();
  final passWordController = TextEditingController();
  final emailController = TextEditingController();
  @override
  void dispose() {
    passWordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 65),
            Text(
              'تسجيل الدخول إلي ليديدرايفر',
              textAlign: TextAlign.end,
              style:
                  textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 35),

            //! البريد الالكترونى
            CustomTextFormField(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return 'valid';
                } else {
                  return 'this field cannot be empty';
                }
              },
              controller: emailController,
              suffixIcon: SvgManger.kMail,
              hintText: 'البريد الالكترونى',
            ),
            const SizedBox(height: 27),
            //! كلمة المرور
            CustomTextFormFiledPassword(
              validator: (value) {
                if (value!.length < 6) {
                  return 'this field cannot be empty';
                } else {
                  return 'valid';
                }
              },
              controller: passWordController,
              suffixIcon: SvgManger.kLock,
              labelText: 'كلمة المرور',
            ),
            const SizedBox(height: 27),
            //! هل نسيت كلمة المرور؟
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const VerificationCodePage();
                    },
                  ),
                );
              },
              child: Text(
                'هل نسيت كلمة المرور؟',
                style: textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 25),
            //!   CheckBox & سياسه الخصوصيه
            const RichTextPrivacyPolicyWidget(),
            const SizedBox(height: 16),
            //! تسجيل الدخول
            GestureDetector(
              onTap: () {
                formkey.currentState!.validate();
              },
              child: const CustomBotton(
                  text: 'تسجيل الدخول',
                  color: ColorManger.kPrimaryColor,
                  textThemeColor: ColorManger.kWhite,
                  borderColor: ColorManger.kPrimaryColor),
            ),
            const SizedBox(height: 40),
            //!RichTextLoginWidget
            RichTextLoginWidget(textTheme: textTheme),
          ],
        ),
      ),
    );
  }
}
