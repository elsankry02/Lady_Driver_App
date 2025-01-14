import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/color_manger.dart';

class TextRichReceiveTheCode extends StatelessWidget {
  const TextRichReceiveTheCode({
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
          const TextSpan(
            text: 'لم تستلم الرمز؟ ',
          ),
          TextSpan(
            text: 'اعاده ارسال الرمز',
            style: textTheme.titleSmall!
                .copyWith(color: ColorManger.kPrimaryColor),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
