import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/components/custom_botton.dart';
import '../../../core/components/custom_icon_change_language.dart';
import '../../../core/components/custom_textformfield.dart';
import '../../../core/components/custom_textformfield_password.dart';
import '../../../core/components/rich_text_privacy_policy.dart';
import '../../../core/constant/color_manger.dart';
import '../../../core/constant/svg_manger.dart';
import '../../../core/router/router.dart';
import '../../../l10n/app_localizations.dart';
import 'widget/rich_text_login_widget.dart';

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
    double mediaQueryHeight = MediaQuery.of(context).size.height;

    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        //! loginToLadyDriver
        title: Text(
          AppLocalizations.of(context)!.loginToLadyDriver,
          style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
        ),
        actions: const [
          //! Custom Icon Change Language
          CustomIconChangeLanguagePage(),
        ],
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          children: [
            SizedBox(height: mediaQueryHeight * 0.035),

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
              hintText: AppLocalizations.of(context)!.email,
            ),
            SizedBox(height: mediaQueryHeight * 0.027),
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
              hintText: AppLocalizations.of(context)!.password,
            ),
            SizedBox(height: mediaQueryHeight * 0.027),
            //! هل نسيت كلمة المرور؟
            GestureDetector(
              onTap: () => context.router.push(const ForgetPasswordRoute()),
              child: Text(
                textAlign: TextAlign.end,
                AppLocalizations.of(context)!.forgotYourPassword,
                style: textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.5,
                ),
              ),
            ),
            SizedBox(height: mediaQueryHeight * 0.025),
            //!   CheckBox & سياسه الخصوصيه
            RichTextPrivacyPolicy(
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  isSelected = value!;
                });
              },
            ),
            SizedBox(height: mediaQueryHeight * 0.016),
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
            SizedBox(height: mediaQueryHeight * 0.045),
            //!RichTextLoginWidget
            RichTextLoginWidget(textTheme: textTheme),
          ],
        ),
      ),
    );
  }
}
