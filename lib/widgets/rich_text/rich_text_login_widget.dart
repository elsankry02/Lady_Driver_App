import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/pages/create_an_account_page.dart';

class RichTextLoginWidget extends StatelessWidget {
  const RichTextLoginWidget({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
        children: [
          //! ليس لديك حساب ؟
          const TextSpan(text: ' ليس لديك حساب؟'),
          //! انشاء حساب
          TextSpan(
              text: ' إنشاء حساب',
              style: textTheme.titleSmall!
                  .copyWith(color: ColorManger.kPrimaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        //! Navigat to CreateAnAccountPage
                        return const CreateAnAccountPage();
                      },
                    ),
                  );
                }),
        ],
      ),
    );
  }
}
