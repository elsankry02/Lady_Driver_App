import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/constant/color_manger.dart';
import '../../../../core/router/router.dart';
import '../../../../l10n/app_localizations.dart';

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
          TextSpan(
            text: AppLocalizations.of(context)!.dontHaveAnAccount,
          ),
          //! انشاء حساب
          TextSpan(
            text: AppLocalizations.of(context)!.createAccount,
            style: textTheme.titleSmall!
                .copyWith(color: ColorManger.kPrimaryColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.router.replace(
                    const CreateAnAccountRoute(),
                  ),
          ),
        ],
      ),
    );
  }
}
