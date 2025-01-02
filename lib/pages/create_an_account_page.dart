import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/components/custom_textformfield.dart';
import 'package:lady_driver/core/components/custom_textformfield_password.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/core/constant/svg_manger.dart';
import 'package:lady_driver/widgets/rich_text/rich_text_create_an_account_widget.dart';

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
  @override
  void dispose() {
    userController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
            //! الاسم
            CustomTextFormField(
              validator: (value) {
                if (value!.isNotEmpty) {
                  return 'valid';
                } else {
                  return 'this field cannot be empty';
                }
              },
              controller: userController,
              suffixIcon: SvgManger.kUser,
              hintText: 'الاسم',
            ),
            const SizedBox(height: 27),
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
              controller: passwordController,
              suffixIcon: SvgManger.kLock,
              labelText: 'كلمة المرور',
            ),
            const SizedBox(height: 52),
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
            const SizedBox(height: 48),
            RichTextCreateAnAccountWidget(textTheme: textTheme),
          ],
        ),
      ),
    );
  }
}
