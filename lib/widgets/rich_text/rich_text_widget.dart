import 'package:flutter/material.dart';
import 'package:lady_driver/core/constant/color_manger.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return RichText(
      textAlign: TextAlign.end,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'عند تسجيل الدخول انت توافق علي ',
            style: textTheme.labelMedium!.copyWith(fontWeight: FontWeight.w300),
          ),
          //! Click
          TextSpan(
            text: ' سياسة الخصوصية \nوالاستخدام',
            style: textTheme.labelMedium!
                .copyWith(color: ColorManger.kPrimaryColor),
          ),
        ],
      ),
    );
  }
}
