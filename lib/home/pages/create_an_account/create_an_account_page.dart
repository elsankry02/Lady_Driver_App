import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../core/components/custom_botton.dart';
import '../../../core/components/custom_textformfield.dart';
import '../../../core/components/custom_textformfield_password.dart';
import '../../../core/components/rich_text_privacy_policy.dart';
import '../../../core/constant/color_manger.dart';
import '../../../core/constant/svg_manger.dart';
import 'widget/circler_image_picker.dart';
import 'widget/enum_create_account_widget.dart';
import 'widget/rich_text_create_an_account_widget.dart';
import '../../../l10n/app_localizations.dart';

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
    const sizedbox = SizedBox(height: 20);
    return Scaffold(
      body: Form(
        key: keyform,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 65),
            //! إنشاء حساب في ليدي درايفر
            Text(
              AppLocalizations.of(context)!.createAnAccountInLadyDriver,
              style:
                  textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 32),
            //! الصورة
            const CirclerImagePicker(),
            sizedbox,
            //! الاسم
            CustomTextFormField(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return 'valid';
                } else {
                  return 'this field cannot be empty';
                }
              },
              hintText: AppLocalizations.of(context)!.name,
              suffixIcon: SvgManger.kUser,
              controller: userController,
            ),
            sizedbox,
            //! البريد الالكترونى
            CustomTextFormField(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return 'valid';
                } else {
                  return 'this field cannot be empty';
                }
              },
              hintText: AppLocalizations.of(context)!.email,
              suffixIcon: SvgManger.kMail,
              controller: emailController,
            ),
            sizedbox,
            //! رقم الهاتف
            CustomTextFormField(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return 'valid';
                } else {
                  return 'this field cannot be empty';
                }
              },
              hintText: AppLocalizations.of(context)!.phoneNumber,
              suffixIcon: SvgManger.kPhone,
              keyboardType: TextInputType.phone,
              controller: phoneController,
            ),
            const SizedBox(height: 10),
            //! تسجيل الدخول ک
            Text(
              AppLocalizations.of(context)!.registerAs,
            ),
            const SizedBox(height: 10),
            //! Create Account Enum Widget
            const EnumsCreateAccountWidget(),
            sizedbox,
            //! كلمة المرور
            CustomTextFormFiledPassword(
              validator: (value) {
                if (value!.length < 6) {
                  return 'this field cannot be empty';
                } else {
                  return 'valid';
                }
              },
              hintText: AppLocalizations.of(context)!.password,
              suffixIcon: SvgManger.kLock,
              controller: passwordController,
            ),
            sizedbox, //! تاكيد كلمه المرور
            CustomTextFormFiledPassword(
              validator: (value) {
                if (value!.length < 6) {
                  return 'this field cannot be empty';
                } else {
                  return 'valid';
                }
              },
              hintText: AppLocalizations.of(context)!.confirmPassword,
              suffixIcon: SvgManger.kLock,
              controller: passwordController,
            ),
            sizedbox,
            //! كود الدعوة
            CustomTextFormField(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return 'valid';
                } else {
                  return 'this field cannot be empty';
                }
              },
              hintText: AppLocalizations.of(context)!.invitationCode,
              suffixIcon: SvgManger.kShare2,
              controller: inviteCodeController,
            ),
            sizedbox,
            //! CheckBox & سياسه الخصوصيه
            RichTextPrivacyPolicy(
              value: isSelected,
              onChanged: (value) {
                setState(() {
                  isSelected = value!;
                });
              },
            ),
            const SizedBox(height: 16),
            //! إنشاء الحساب
            GestureDetector(
              onTap: isSelected
                  ? () {
                      keyform.currentState!.validate();
                    }
                  : null,
              child: CustomBotton(
                  text: AppLocalizations.of(context)!.createAccount,
                  color: isSelected
                      ? ColorManger.kPrimaryColor
                      : ColorManger.kBorderColor,
                  textThemeColor: ColorManger.kWhite,
                  borderColor: isSelected
                      ? ColorManger.kPrimaryColor
                      : ColorManger.kBorderColor),
            ),
            const SizedBox(height: 30),
            //! Rich Text
            RichTextCreateAnAccountWidget(textTheme: textTheme),
            sizedbox,
          ],
        ),
      ),
    );
  }
}
