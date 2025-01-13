import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/components/custom_textformfield.dart';
import 'package:lady_driver/core/components/custom_textformfield_password.dart';
import 'package:lady_driver/core/components/rich_text_privacy_policy.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/core/constant/svg_manger.dart';
import 'package:lady_driver/core/router/router.dart';
import 'package:lady_driver/home/pages/login/widget/rich_text_login_widget.dart';
import 'package:lady_driver/l10n/app_localizations.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSelected = false;

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
              AppLocalizations.of(context)!.loginToLadyDriver,
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
              hintText: 'كلمة المرور',
            ),
            const SizedBox(height: 27),
            //! هل نسيت كلمة المرور؟
            GestureDetector(
              onTap: () => context.router.push(const ForgetPasswordRoute()),
              child: Text(
                textAlign: TextAlign.end,
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
            RichTextPrivacyPolicy(
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  isSelected = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            //! تسجيل الدخول
            GestureDetector(
              onTap: isSelected
                  ? () {
                      formkey.currentState!.validate();
                    }
                  : null,
              child: CustomBotton(
                  text: AppLocalizations.of(context)!.logIN,
                  color: isSelected
                      ? ColorManger.kPrimaryColor
                      : ColorManger.kBorderColor,
                  textThemeColor: ColorManger.kWhite,
                  borderColor: isSelected
                      ? ColorManger.kPrimaryColor
                      : ColorManger.kBorderColor),
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
