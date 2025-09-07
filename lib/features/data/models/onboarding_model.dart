import 'package:flutter/material.dart';
import 'package:lady_driver/core/constant/app_images.dart';
import 'package:lady_driver/l10n/app_localizations.dart';

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
      AppImages.kOndoarding1,
      appLocalizations.ladyDriverYourComfortComesFirstonboardind,
      appLocalizations.determineYourDestinationAndChooseTheCarThatSuitsYou,
    ),
    OnboardingModel(
      AppImages.kOndoarding2,
      appLocalizations.discoverANewWorldOfLuxury,
      appLocalizations.enjoyAUniqueDeliveryServiceDesignedEspeciallyForYou,
    ),
  ];
}
