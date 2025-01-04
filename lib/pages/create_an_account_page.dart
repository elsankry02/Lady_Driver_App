import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/components/custom_textformfield.dart';
import 'package:lady_driver/core/components/custom_textformfield_password.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/core/constant/svg_manger.dart';
import 'package:lady_driver/widgets/botton/create_account_enum_widget.dart';
import 'package:lady_driver/widgets/rich_text/rich_text_create_an_account_widget.dart';
import 'package:lady_driver/widgets/rich_text/rich_text_privacy_policy_widget.dart';

class CreateAnAccountPage extends StatefulWidget {
  const CreateAnAccountPage({super.key});

  @override
  State<CreateAnAccountPage> createState() => _CreateAnAccountPageState();
}

class _CreateAnAccountPageState extends State<CreateAnAccountPage> {
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
            Text(
              'إنشاء حساب في ليدي درايفر',
              textAlign: TextAlign.end,
              style:
                  textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 32),

            Container(
              margin: const EdgeInsets.symmetric(horizontal: 130),
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(130),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/medo.png'),
                ),
                color: ColorManger.kBorderColor,
              ),
            ),
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
              hintText: 'الاسم',
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
              hintText: 'البريد الالكترونى',
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
              hintText: 'رقم الهاتف',
              suffixIcon: SvgManger.kPhone,
              keyboardType: TextInputType.phone,
              controller: phoneController,
            ),
            const SizedBox(height: 10),
            const Text('تسجيل الدخول ک'),
            const SizedBox(height: 10),
            //! Create Account Enum Widget
            CreateAccountEnumWidget(textTheme: textTheme),
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
              hintText: 'كلمة المرور',
              suffixIcon: SvgManger.kLock,
              controller: passwordController,
            ),
            sizedbox, //! كلمة المرور
            CustomTextFormFiledPassword(
              validator: (value) {
                if (value!.length < 6) {
                  return 'this field cannot be empty';
                } else {
                  return 'valid';
                }
              },
              hintText: 'تاكيد كلمه المرور',
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
              hintText: 'كود الدعوة',
              suffixIcon: SvgManger.kShare2,
              controller: inviteCodeController,
            ),
            sizedbox,
            //!   CheckBox & سياسه الخصوصيه
            const RichTextPrivacyPolicyWidget(),
            const SizedBox(height: 16),
            //! إنشاء الحساب
            GestureDetector(
              onTap: () {
                keyform.currentState!.validate();
              },
              child: const CustomBotton(
                  text: 'إنشاء الحساب',
                  color: ColorManger.kPrimaryColor,
                  textThemeColor: ColorManger.kWhite,
                  borderColor: ColorManger.kPrimaryColor),
            ),
            const SizedBox(height: 30),
            RichTextCreateAnAccountWidget(textTheme: textTheme),
            sizedbox,
          ],
        ),
      ),
    );
  }
}
