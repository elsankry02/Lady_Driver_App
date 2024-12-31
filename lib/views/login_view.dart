import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/components/custom_textformfield.dart';
import 'package:lady_driver/core/components/custom_textformfield_password.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/core/constant/svg_manger.dart';
import 'package:lady_driver/views/create_an_account.dart';
import 'package:lady_driver/views/forget_password_view.dart';
import 'package:lady_driver/widgets/rich_text/rich_text_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 65),
          Text(
            'تسجيل الدخول إلي ليديدرايفر',
            textAlign: TextAlign.end,
            style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 35),

          //! البريد الالكترونى
          CustomTextFormField(
            controller: emailController,
            suffixIcon: SvgManger.kMail,
            hintText: 'البريد الالكترونى',
          ),
          const SizedBox(height: 27),
          //! كلمة المرور
          CustomTextFormFiledPassword(
            controller: passWordController,
            suffixIcon: SvgManger.kLock,
            labelText: 'كلمة المرور',
          ),
          const SizedBox(height: 27),
          //! هل نسيت كلمة المرور؟
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const ForgetPasswordView();
                  },
                ),
              );
            },
            child: Text(
              ' هل نسيت كلمة المرور؟',
              style:
                  textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
            ),
          ),
          const SizedBox(height: 25),
          //! (Text icRh) سياسه الخصوصيه
          const RichTextWidget(),
          const SizedBox(height: 16),
          //! تسجيل الدخول
          const CustomBotton(
              text: 'تسجيل الدخول',
              color: ColorManger.kPrimaryColor,
              textThemeColor: ColorManger.kWhite,
              borderColor: ColorManger.kPrimaryColor),
          const SizedBox(height: 25),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //! انشاء حساب
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const CreateAnAccount();
                      },
                    ),
                  );
                },
                child: Text(
                  'إنشاء حساب',
                  style: textTheme.titleSmall!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: ColorManger.kPrimaryColor),
                ),
              ),
              //! ليس لديك حساب ؟
              Text(
                ' ليس لديك حساب ؟',
                style:
                    textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
