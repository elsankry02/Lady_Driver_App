import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/components/custom_textformfield.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/core/constant/image_manger.dart';
import 'package:lady_driver/core/constant/svg_manger.dart';
import 'package:lady_driver/home/pages/verification_code/verification_code_page.dart';

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
          'نسيت كلمة المرور',
          style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
        ),
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
              'ادخل بريدك الالكتروني',
              textAlign: TextAlign.end,
              style:
                  textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              validator: (value) {
                if (value!.contains(value = '@gmail.com')) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const VerificationCodePage();
                    },
                  ));
                } else {
                  return 'this field cannot be empty';
                }
                return null;
              },
              controller: emailController,
              suffixIcon: SvgManger.kMail,
              hintText: 'البريد الالكترونى',
            ),
            const SizedBox(height: 30),
            //! إرسال الرمز
            GestureDetector(
              onTap: () {
                formkey.currentState!.validate();
              },
              child: const CustomBotton(
                  text: 'إرسال الرمز',
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
