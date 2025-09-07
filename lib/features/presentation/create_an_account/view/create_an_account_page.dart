import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../core/components/custom_botton.dart';
import '../../../../core/components/custom_icon_change_language.dart';
import '../../../../core/components/custom_textformfield.dart';
import '../../../../core/components/custom_textformfield_password.dart';
import '../../../../core/components/rich_text_privacy_policy.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/constant/app_svgs.dart';
import '../../../../l10n/app_localizations.dart';
import '../widget/circler_image_picker.dart';
import '../widget/enum_create_account_widget.dart';
import '../widget/rich_text_create_an_account_widget.dart';

@RoutePage()
class CreateAnAccountPage extends StatefulWidget {
  const CreateAnAccountPage({super.key});

  @override
  State<CreateAnAccountPage> createState() => _CreateAnAccountPageState();
}

class _CreateAnAccountPageState extends State<CreateAnAccountPage> {
  bool isSelected = false;
  final GlobalKey<FormState> keyform = GlobalKey();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final inviteCodeController = TextEditingController();
  @override
  void dispose() {
    userController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    inviteCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title:
            //! إنشاء حساب في ليدي درايفر
            Text(
          appLocalizations.createAnAccountInLadyDriver,
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
        key: keyform,
        child: ListView(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          children: [
            SizedBox(height: mediaQueryHeight * 0.032),
            //! الصورة
            const CirclerImagePicker(),
            SizedBox(height: mediaQueryHeight * 0.020),

            //! الاسم
            CustomTextFormField(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return 'valid';
                } else {
                  return 'this field cannot be empty';
                }
              },
              hintText: appLocalizations.name,
              suffixIcon: AppSvgs.kUser,
              controller: userController,
            ),
            SizedBox(height: mediaQueryHeight * 0.020),
            //! البريد الالكترونى
            CustomTextFormField(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return 'valid';
                } else {
                  return 'this field cannot be empty';
                }
              },
              hintText: appLocalizations.email,
              suffixIcon: AppSvgs.kMail,
              controller: emailController,
            ),
            SizedBox(height: mediaQueryHeight * 0.020),
            //! رقم الهاتف
            CustomTextFormField(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return 'valid';
                } else {
                  return 'this field cannot be empty';
                }
              },
              hintText: appLocalizations.phoneNumber,
              suffixIcon: AppSvgs.kPhone,
              keyboardType: TextInputType.phone,
              controller: phoneController,
            ),
            SizedBox(height: mediaQueryHeight * 0.010),

            //! تسجيل الدخول ک
            Text(
              appLocalizations.registerAs,
            ),
            SizedBox(height: mediaQueryHeight * 0.010),
            //! Create Account Enum Widget
            const EnumsCreateAccountWidget(),
            SizedBox(height: mediaQueryHeight * 0.020),
            //! كلمة المرور
            CustomTextFormFiledPassword(
              validator: (value) {
                if (value!.length < 6) {
                  return 'this field cannot be empty';
                } else {
                  return 'valid';
                }
              },
              hintText: appLocalizations.password,
              suffixIcon: AppSvgs.kLock,
              controller: passwordController,
            ),
            SizedBox(height: mediaQueryHeight * 0.020),
            //! تاكيد كلمه المرور
            CustomTextFormFiledPassword(
              validator: (value) {
                if (value!.length < 6) {
                  return 'this field cannot be empty';
                } else {
                  return 'valid';
                }
              },
              hintText: appLocalizations.confirmPassword,
              suffixIcon: AppSvgs.kLock,
              controller: passwordController,
            ),
            SizedBox(height: mediaQueryHeight * 0.020),
            //! كود الدعوة
            CustomTextFormField(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return 'valid';
                } else {
                  return 'this field cannot be empty';
                }
              },
              hintText: appLocalizations.invitationCode,
              suffixIcon: AppSvgs.kShare2,
              controller: inviteCodeController,
            ),
            SizedBox(height: mediaQueryHeight * 0.020),
            //! CheckBox & سياسه الخصوصيه
            RichTextPrivacyPolicy(
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  isSelected = value!;
                });
              },
            ),
            SizedBox(height: mediaQueryHeight * 0.016),

            //! إنشاء الحساب
            GestureDetector(
              onTap: isSelected
                  ? () {
                      keyform.currentState!.validate();
                    }
                  : null,
              child: CustomBotton(
                  text: appLocalizations.createAccount,
                  color: isSelected
                      ? AppColors.kPrimaryColor
                      : AppColors.kBorderColor,
                  textThemeColor: AppColors.kWhite,
                  borderColor: isSelected
                      ? AppColors.kPrimaryColor
                      : AppColors.kBorderColor),
            ),
            SizedBox(height: mediaQueryHeight * 0.030),
            //! Rich Text
            RichTextCreateAnAccountWidget(textTheme: textTheme),
            SizedBox(height: mediaQueryHeight * 0.020),
          ],
        ),
      ),
    );
  }
}
