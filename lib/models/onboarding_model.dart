class OnboardingModel {
  final String? skip;
  final String image;
  final String lableText;
  final String text;

  OnboardingModel(this.image, this.text, this.lableText, {this.skip});
}

List<OnboardingModel> listOnBoarding = [
  OnboardingModel('assets/image/car5_1.png', '.ليديدرايفر: راحتكِ أولاً',
      'حددي وجهتكِ واختاري السيارة المناسبة لكِ',
      skip: 'تخطي'),
  OnboardingModel(
    'assets/image/car2_1.png',
    'اكتشفي عالم جديد من الرفاهية',
    '.استمتعي بخدمة توصيل فريدة من نوعها مصممة خصيصًا \n لكِ',
  ),
];
