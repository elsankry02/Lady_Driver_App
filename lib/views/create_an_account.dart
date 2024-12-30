import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/components/custom_textformfield.dart';
import 'package:lady_driver/core/components/custom_textformfield_password.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/core/constant/svg_manger.dart';
import 'package:lady_driver/views/login_view.dart';

class CreateAnAccount extends StatelessWidget {
  const CreateAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          const SizedBox(height: 65),
          Text(
            'إنشاء حساب في ليدي درايفر',
            textAlign: TextAlign.end,
            style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 32),
          //! الاسم
          const CustomTextFormField(
            suffixIcon: SvgManger.kUser,
            hintText: 'الاسم',
          ),
          const SizedBox(height: 27),
          //! البريد الالكترونى
          const CustomTextFormField(
            suffixIcon: SvgManger.kMail,
            hintText: 'البريد الالكترونى',
          ),
          const SizedBox(height: 27),
          //! كلمة المرور
          const CustomTextFormFiledPassword(
            suffixIcon: SvgManger.kLock,
            labelText: 'كلمة المرور',
          ),
          const SizedBox(height: 52),
          //! إنشاء الحساب
          const CustomBotton(
              text: 'إنشاء الحساب',
              color: ColorManger.kPrimaryColor,
              textThemeColor: ColorManger.kWhite,
              borderColor: ColorManger.kPrimaryColor),
          const SizedBox(height: 61),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //! تسجيل الدخول
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginView();
                      },
                    ),
                  );
                },
                child: Text(
                  'تسجيل الدخول',
                  style: textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: ColorManger.kPrimaryColor,
                  ),
                ),
              ),
              //! لديك حساب بالفعل ؟
              Text(
                ' لديك حساب بالفعل ؟',
                style:
                    textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }
}
