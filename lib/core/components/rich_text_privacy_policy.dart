import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../constant/app_colors.dart';

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
    double mediaQueryWidth = MediaQuery.of(context).size.width;
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    final appLocalizations = AppLocalizations.of(context)!;
    return Row(
      children: [
        //! checkBox
        Container(
          margin: EdgeInsetsDirectional.symmetric(
              horizontal: mediaQueryWidth * 0.020),
          height: mediaQueryHeight * 0.025,
          width: mediaQueryWidth * 0.025,
          child: Checkbox(
            activeColor: AppColors.kPrimaryColor,
            value: widget.value,
            onChanged: widget.onChanged,
          ),
        ),
        SizedBox(width: mediaQueryWidth * 0.020),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: appLocalizations.whenYouLogInYouAgreeTo,
                style: textTheme.labelMedium!
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              //! Click
              TextSpan(
                text: appLocalizations.privacyPolicy,
                style: textTheme.labelMedium!
                    .copyWith(color: AppColors.kPrimaryColor),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              TextSpan(
                  text: appLocalizations.and,
                  style: textTheme.labelMedium!
                      .copyWith(fontWeight: FontWeight.w300)),
              TextSpan(
                text: appLocalizations.termsOfUse,
                style: textTheme.labelMedium!
                    .copyWith(color: AppColors.kPrimaryColor),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
