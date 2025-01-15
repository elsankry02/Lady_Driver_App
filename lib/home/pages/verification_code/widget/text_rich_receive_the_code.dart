import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../l10n/app_localizations.dart';

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
          TextSpan(
            text: AppLocalizations.of(context)!.didNotReceiveTheCode,
          ),
          TextSpan(
            text: AppLocalizations.of(context)!.resendCode,
            style: textTheme.titleSmall!
                .copyWith(color: ColorManger.kPrimaryColor),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
