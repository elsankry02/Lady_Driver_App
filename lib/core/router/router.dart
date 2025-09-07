import 'package:auto_route/auto_route.dart';
import '../components/custom_icon_change_language.dart';

import '../../features/presentation/change_language/change_language_page.dart';
import '../../features/presentation/create_an_account/view/create_an_account_page.dart';
import '../../features/presentation/forget_password/forget_password_page.dart';
import '../../features/presentation/login/view/login_page.dart';
import '../../features/presentation/modify_password/modify_password_page.dart';
import '../../features/presentation/on_boarding/view/onboarding_page.dart';
import '../../features/presentation/splash/splash_page.dart';
import '../../features/presentation/verification_code/view/verification_code_page.dart';
import '../../features/presentation/welcome/welcome_page.dart';

part 'router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: CreateAnAccountRoute.page),
        AutoRoute(page: ForgetPasswordRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: ModifyPasswordRoute.page),
        AutoRoute(page: OnboardingRoute.page),
        AutoRoute(page: VerificationCodeRoute.page),
        AutoRoute(page: WelcomeRoute.page),
        AutoRoute(page: ChangeLanguageRoute.page),
        AutoRoute(page: CustomIconChangeLanguageRoute.page)
      ];
}
