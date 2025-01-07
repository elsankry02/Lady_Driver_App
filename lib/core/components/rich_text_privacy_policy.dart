import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lady_driver/core/constant/color_manger.dart';

class RichTextPrivacyPolicy extends StatefulWidget {
  const RichTextPrivacyPolicy({super.key, this.onChanged, this.value});
  final bool? value;
  final void Function(bool? value)? onChanged;
  @override
  State<RichTextPrivacyPolicy> createState() => _RichTextPrivacyPolicyState();
}

class _RichTextPrivacyPolicyState extends State<RichTextPrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RichText(
          textAlign: TextAlign.end,
          text: TextSpan(
            children: [
              TextSpan(
                text: 'عند تسجيل الدخول انت توافق علي ',
                style: textTheme.labelMedium!
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              //! Click
              TextSpan(
                text: 'سياسه\n الخصوصيه ',
                style: textTheme.labelMedium!
                    .copyWith(color: ColorManger.kPrimaryColor),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              TextSpan(
                  text: 'و ',
                  style: textTheme.labelMedium!
                      .copyWith(fontWeight: FontWeight.w300)),
              TextSpan(
                text: 'شروط الاستخدام',
                style: textTheme.labelMedium!
                    .copyWith(color: ColorManger.kPrimaryColor),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        //! checkBox
        SizedBox(
          height: 15,
          width: 15,
          child: Checkbox(
            activeColor: ColorManger.kPrimaryColor,
            value: widget.value,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
