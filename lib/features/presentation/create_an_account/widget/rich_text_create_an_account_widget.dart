import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/app_colors.dart';
import '../../../../core/router/router.dart';
import '../../../../l10n/app_localizations.dart';

class RichTextCreateAnAccountWidget extends StatelessWidget {
  const RichTextCreateAnAccountWidget({super.key, required this.textTheme});
  final TextTheme textTheme;
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
        children: [
          //! لديك حساب بالفعل ؟
          TextSpan(
            text: appLocalizations.alreadyHaveAnAccount,
            style: textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),
          ),
          //! تسجيل الدخول
          TextSpan(
            text: appLocalizations.logIN,
            style: textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w400, color: AppColors.kPrimaryColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.router.replace(const LoginRoute()),
          ),
        ],
      ),
    );
  }
}
