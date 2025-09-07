import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../../core/components/custom_icon_change_language.dart';
import '../../../../core/constant/app_colors.dart';
import '../../../../core/router/router.dart';
import '../../../../l10n/app_localizations.dart';
import '../widget/text_rich_receive_the_code.dart';

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
    double mediaQueryHeight = MediaQuery.of(context).size.height;
    final appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        forceMaterialTransparency: true,
        //! AppBar Name
        title: Text(
          appLocalizations.verificationcode,
          style: textTheme.headlineSmall!.copyWith(fontWeight: FontWeight.w500),
        ),
        //! Custom Icon Change Language
        actions: const [
          CustomIconChangeLanguagePage(),
        ],
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
          children: [
            SizedBox(height: mediaQueryHeight * 0.024),
            //! رساله الادخال
            Text(
                textAlign: TextAlign.center,
                appLocalizations.enterTheCodeThatWasSentToYourEmailAddress,
                style: textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w500)),
            SizedBox(height: mediaQueryHeight * 0.007),
            //! البريد الالكتروني
            Text(
              textAlign: TextAlign.center,
              'be*****@gmail.com',
              style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.kPrimaryColor),
            ),
            SizedBox(height: mediaQueryHeight * 0.048),
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
            SizedBox(height: mediaQueryHeight * 0.048),
            //! TextRichReceiveTheCode
            TextRichReceiveTheCode(textTheme: textTheme),
          ],
        ),
      ),
    );
  }
}
