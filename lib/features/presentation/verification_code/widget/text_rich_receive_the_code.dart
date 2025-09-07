import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class TextRichReceiveTheCode extends StatelessWidget {
  const TextRichReceiveTheCode({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
        children: [
          TextSpan(
            text: appLocalizations.didNotReceiveTheCode,
          ),
          TextSpan(
            text: appLocalizations.resendCode,
            style:
                textTheme.titleSmall!.copyWith(color: AppColors.kPrimaryColor),
            recognizer: TapGestureRecognizer()..onTap = () {},
          ),
        ],
      ),
    );
  }
}
