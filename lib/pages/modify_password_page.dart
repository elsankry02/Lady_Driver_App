import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/components/custom_textformfield_password.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/core/constant/svg_manger.dart';

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
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          ' نسيت كلمة المرور',
          style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 30),
            Text(
              'ادخل كلمة المرور الجديدة ',
              style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            //!  كلمه المرور
            CustomTextFormFiledPassword(
              labelText: 'كلمة المرور',
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
            const SizedBox(height: 44),
            //! تاكيد كلمه المرور
            CustomTextFormFiledPassword(
              labelText: 'تأكيد كلمة المرور',
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
            const SizedBox(height: 32),
            //! CustomBotton (حفظ)
            GestureDetector(
              onTap: () {
                formkey.currentState!.validate();
              },
              child: const CustomBotton(
                  text: 'حفظ',
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
