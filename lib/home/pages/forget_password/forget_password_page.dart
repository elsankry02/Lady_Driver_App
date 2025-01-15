import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../core/components/custom_icon_change_language.dart';
import '../../../l10n/app_localizations.dart';

import '../../../core/components/custom_botton.dart';
import '../../../core/components/custom_textformfield.dart';
import '../../../core/constant/color_manger.dart';
import '../../../core/constant/image_manger.dart';
import '../../../core/constant/svg_manger.dart';
import '../../../core/router/router.dart';

@RoutePage()
class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  final GlobalKey<FormState> formkey = GlobalKey();
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
        centerTitle: true,
        //! نسيت كلمة المرور
        title: Text(
          AppLocalizations.of(context)!.forgotPassword,
          style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
        ),
        actions: const [
          //! Custom Icon Change Language
          CustomIconChangeLanguagePage(),
        ],
      ),
      body: Form(
        key: formkey,
        child: ListView(
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
              AppLocalizations.of(context)!.enterYourEmail,
              style:
                  textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              validator: (value) {
                if (value!.length < 5) {
                  return 'this field cannot be empty';
                } else {
                  context.router.push(const VerificationCodeRoute());
                }
                return null;
              },
              controller: emailController,
              suffixIcon: SvgManger.kMail,
              hintText: AppLocalizations.of(context)!.email,
            ),
            const SizedBox(height: 30),
            //! إرسال الرمز
            GestureDetector(
              onTap: () {
                formkey.currentState!.validate();
              },
              child: CustomBotton(
                  text: AppLocalizations.of(context)!.sendCode,
                  color: ColorManger.kPrimaryColor,
                  textThemeColor: ColorManger.kWhite,
                  borderColor: ColorManger.kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
