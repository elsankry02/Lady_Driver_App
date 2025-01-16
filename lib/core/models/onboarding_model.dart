import 'package:flutter/material.dart';
import 'package:lady_driver/l10n/app_localizations.dart';

import '../constant/image_manger.dart';

class OnboardingModel {
  final String image;
  final String lableText;
  final String text;

  OnboardingModel(this.image, this.text, this.lableText);
}

List<OnboardingModel> listOnBoarding(BuildContext context) {
  final appLocalizations = AppLocalizations.of(context)!;
  return [
    OnboardingModel(
      ImageManger.kOndoarding1,
      appLocalizations.ladyDriverYourComfortComesFirstonboardind,
      appLocalizations.determineYourDestinationAndChooseTheCarThatSuitsYou,
    ),
    OnboardingModel(
      ImageManger.kOndoarding2,
      appLocalizations.discoverANewWorldOfLuxury,
      appLocalizations.enjoyAUniqueDeliveryServiceDesignedEspeciallyForYou,
    ),
  ];
}
