import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../core/components/custom_icon_change_language.dart';
import '../../../l10n/app_localizations.dart';
import 'package:pinput/pinput.dart';

import '../../../core/constant/color_manger.dart';
import '../../../core/router/router.dart';
import 'widget/text_rich_receive_the_code.dart';

@RoutePage()
class VerificationCodePage extends StatefulWidget {
  const VerificationCodePage({super.key});

  @override
  State<VerificationCodePage> createState() => _VerificationCodePageState();
}

class _VerificationCodePageState extends State<VerificationCodePage> {
  final pinputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const sizedBox = SizedBox(height: 48);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        //! AppBar Name
        title: Text(
          AppLocalizations.of(context)!.verificationcode,
          style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
        ),
        //! Custom Icon Change Language
        actions: const [
          CustomIconChangeLanguagePage(),
        ],
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(
              height: 24,
            ),
            //! رساله الادخال
            Text(
                textAlign: TextAlign.center,
                AppLocalizations.of(context)!
                    .enterTheCodeThatWasSentToYourEmailAddress,
                style: textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w500)),
            const SizedBox(height: 7),
            //! البريد الالكتروني
            Text(
              textAlign: TextAlign.center,
              'be*****@gmail.com',
              style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: ColorManger.kPrimaryColor),
            ),
            sizedBox,
            //! PinPut
            Pinput(
              autofocus: true,
              validator: (value) {
                if (value!.length < 4) {
                  return 'this field cannot be empty';
                } else {
                  context.router.push(const ModifyPasswordRoute());
                }
                return null;
              },
              controller: pinputController,
            ),
            sizedBox,
            //! TextRichReceiveTheCode
            TextRichReceiveTheCode(textTheme: textTheme),
          ],
        ),
      ),
    );
  }
}
