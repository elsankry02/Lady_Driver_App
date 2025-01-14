import '../constant/image_manger.dart';

class OnboardingModel {
  final String image;
  final String lableText;
  final String text;

  OnboardingModel(this.image, this.text, this.lableText);
}

List<OnboardingModel> listOnBoarding = [
  OnboardingModel(
    ImageManger.kOndoarding1,
    ".ليديدرايفر: راحتكِ أولاً",
    'حددي وجهتكِ واختاري السيارة المناسبة لكِ',
  ),
  OnboardingModel(
    ImageManger.kOndoarding2,
    'اكتشفي عالم جديد من الرفاهية',
    '.استمتعي بخدمة توصيل فريدة من نوعها مصممة خصيصًا \n لكِ',
  ),
];
