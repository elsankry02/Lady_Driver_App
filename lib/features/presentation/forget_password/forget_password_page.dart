import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lady_driver/core/constant/app_images.dart';

import '../../../core/components/custom_botton.dart';
import '../../../core/components/custom_icon_change_language.dart';
import '../../../core/components/custom_textformfield.dart';
import '../../../core/constant/app_colors.dart';
import '../../../core/constant/app_svgs.dart';
import '../../../core/router/router.dart';
import '../../../l10n/app_localizations.dart';

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
    final appLocalizations = AppLocalizations.of(context)!;

    final textTheme = Theme.of(context).textTheme;
    double mediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        //! نسيت كلمة المرور
        centerTitle: true,
        title: Text(
          appLocalizations.forgotPassword,
          style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
        ),
        actions: const [
          //! Custom Icon Change Language
          CustomIconChangeLanguagePage(),
        ],
        forceMaterialTransparency: true,
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          children: [
            SizedBox(height: mediaQueryHeight * 0.020),
            Image.asset(
              width: 254,
              height: 254,
              AppImages.kForgetpassword,
            ),
            SizedBox(height: mediaQueryHeight * 0.020),

            //! ادخل بريدك الالكتروني
            Text(
              appLocalizations.enterYourEmail,
              style:
                  textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: mediaQueryHeight * 0.030),

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
              suffixIcon: AppSvgs.kMail,
              hintText: appLocalizations.email,
            ),
            SizedBox(height: mediaQueryHeight * 0.030),

            //! إرسال الرمز
            GestureDetector(
              onTap: () {
                formkey.currentState!.validate();
              },
              child: CustomBotton(
                  text: appLocalizations.sendCode,
                  color: AppColors.kPrimaryColor,
                  textThemeColor: AppColors.kWhite,
                  borderColor: AppColors.kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
