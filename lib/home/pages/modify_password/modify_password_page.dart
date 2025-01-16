import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../core/components/custom_botton.dart';
import '../../../core/components/custom_icon_change_language.dart';
import '../../../core/components/custom_textformfield_password.dart';
import '../../../core/constant/color_manger.dart';
import '../../../core/constant/svg_manger.dart';
import '../../../l10n/app_localizations.dart';

@RoutePage()
class ModifyPasswordPage extends StatefulWidget {
  const ModifyPasswordPage({super.key});

  @override
  State<ModifyPasswordPage> createState() => _ModifyPasswordPageState();
}

class _ModifyPasswordPageState extends State<ModifyPasswordPage> {
  final GlobalKey<FormState> formkey = GlobalKey();
  final passWordController = TextEditingController();
  final confirmPassWordController = TextEditingController();
  @override
  void dispose() {
    passWordController.dispose();
    confirmPassWordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;

    final textTheme = Theme.of(context).textTheme;
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        //! نسيت كلمة المرور
        title: Text(
          appLocalizations.modifyPassword,
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
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          children: [
            SizedBox(height: mediaQueryHeight * 0.030),
            Text(
              appLocalizations.enterTheNewPassword,
              style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
            ),
            SizedBox(height: mediaQueryHeight * 0.008),
            //!  كلمه المرور
            CustomTextFormFiledPassword(
              hintText: appLocalizations.password,
              suffixIcon: SvgManger.kLock,
              controller: passWordController,
              validator: (value) {
                if (value!.length < 6) {
                  return 'this field cannot be empty';
                } else {
                  return 'Success';
                }
              },
            ),
            SizedBox(height: mediaQueryHeight * 0.030),

            //! تاكيد كلمه المرور
            CustomTextFormFiledPassword(
              hintText: appLocalizations.confirmPassword,
              suffixIcon: SvgManger.kLock,
              controller: confirmPassWordController,
              validator: (value) {
                if (value!.length < 6) {
                  return 'this field cannot be empty';
                } else {
                  return 'Success';
                }
              },
            ),
            SizedBox(height: mediaQueryHeight * 0.030),
            //! CustomBotton (حفظ)
            GestureDetector(
              onTap: () {
                formkey.currentState!.validate();
              },
              child: CustomBotton(
                  text: appLocalizations.save,
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
