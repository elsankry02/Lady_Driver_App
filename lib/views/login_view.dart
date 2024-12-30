import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/components/custom_textfiled.dart';
import 'package:lady_driver/core/components/custom_textfiled_password.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/core/constant/svg_manger.dart';
import 'package:lady_driver/views/create_an_account.dart';
import 'package:lady_driver/views/forget_password_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
          const CustomTextFiled(
            suffixIcon: SvgManger.kMail,
            hintText: 'البريد الالكترونى',
          ),
          const SizedBox(height: 27),
          //! كلمة المرور
          const CustomTextfiledPassword(
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
          //! سياسه الخصوصيه
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'عند تسجيل الدخول انت توافق علي سياسة الخصوصية \nوالاستخدام',
                textAlign: TextAlign.end,
                style: textTheme.labelMedium!
                    .copyWith(fontWeight: FontWeight.w300),
              ),
            ],
          ),
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
