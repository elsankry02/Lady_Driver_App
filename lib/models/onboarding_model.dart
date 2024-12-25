class OnboardingModel {
  final String? skip;
  final String image;
  final String lable;
  final String body;

  OnboardingModel(this.image, this.body, this.lable, {this.skip});
}

List<OnboardingModel> listOnBoarding = [
  OnboardingModel('assets/image/car5 1.png', '.ليديدرايفر: راحتكِ أولاً',
      'حددي وجهتكِ واختاري السيارة المناسبة لكِ',
      skip: 'تخطي'),
  OnboardingModel(
    'assets/image/car2 1.png',
    'اكتشفي عالم جديد من الرفاهية',
    '.استمتعي بخدمة توصيل فريدة من نوعها مصممة خصيصًا لكِ',
  ),
];
