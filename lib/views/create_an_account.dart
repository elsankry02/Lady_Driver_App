import 'package:flutter/material.dart';
import 'package:lady_driver/core/components/custom_botton.dart';
import 'package:lady_driver/core/components/custom_textfiled.dart';
import 'package:lady_driver/core/components/custom_textfiled_password.dart';
import 'package:lady_driver/core/constant/const_manager.dart';
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
          const SizedBox(
            height: 65,
          ),
          Text(
            'إنشاء حساب في ليدي درايفر',
            textAlign: TextAlign.end,
            style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 32,
          ),
          //! Name
          const CustomTextFiled(
              suffixIcon: 'assets/svg/user.svg', hintText: 'الاسم'),
          const SizedBox(
            height: 27,
          ),
          //! Mail
          const CustomTextFiled(
              suffixIcon: 'assets/svg/mail.svg', hintText: 'البريد الالكترونى'),
          const SizedBox(
            height: 27,
          ),
          //! lock
          const CustomTextfiledPassword(
              suffixIcon: 'assets/svg/lock.svg', labelText: 'كلمة المرور'),
          const SizedBox(
            height: 52,
          ),
          //! CustomBotton
          const CustomBotton(
              text: 'إنشاء الحساب',
              color: kPrimaryColor,
              textThemeColor: kWhite,
              borderColor: kPrimaryColor),
          const SizedBox(
            height: 61,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //! Log in
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
                      fontWeight: FontWeight.w400, color: kPrimaryColor),
                ),
              ),
              const SizedBox(width: 2),
              //! I have an account
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
