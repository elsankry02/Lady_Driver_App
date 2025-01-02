import 'package:lady_driver/core/constant/image_manger.dart';

class OnboardingModel {
  final String? skip;
  final String image;
  final String lableText;
  final String text;

  OnboardingModel(this.image, this.text, this.lableText, {this.skip});
}

List<OnboardingModel> listOnBoarding = [
  OnboardingModel(
    ImageManger.kOndoarding1,
    '.ليديدرايفر: راحتكِ أولاً',
    'حددي وجهتكِ واختاري السيارة المناسبة لكِ',
    skip: 'تخطي',
  ),
  OnboardingModel(
    ImageManger.kOndoarding2,
    'اكتشفي عالم جديد من الرفاهية',
    '.استمتعي بخدمة توصيل فريدة من نوعها مصممة خصيصًا \n لكِ',
  ),
];
