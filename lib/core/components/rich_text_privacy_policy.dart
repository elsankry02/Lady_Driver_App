import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/l10n/app_localizations.dart';

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
      children: [
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
        const SizedBox(width: 10),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: AppLocalizations.of(context)!.whenYouLogInYouAgreeTo,
                style: textTheme.labelMedium!
                    .copyWith(fontWeight: FontWeight.w300),
              ),
              //! Click
              TextSpan(
                text: AppLocalizations.of(context)!.privacyPolicy,
                style: textTheme.labelMedium!
                    .copyWith(color: ColorManger.kPrimaryColor),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
              TextSpan(
                  text: AppLocalizations.of(context)!.and,
                  style: textTheme.labelMedium!
                      .copyWith(fontWeight: FontWeight.w300)),
              TextSpan(
                text: AppLocalizations.of(context)!.termsOfUse,
                style: textTheme.labelMedium!
                    .copyWith(color: ColorManger.kPrimaryColor),
                recognizer: TapGestureRecognizer()..onTap = () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
