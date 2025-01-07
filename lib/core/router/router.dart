import 'package:auto_route/auto_route.dart';
import 'package:lady_driver/pages/create_an_account/create_an_account_page.dart';
import 'package:lady_driver/pages/forget_password/forget_password_page.dart';
import 'package:lady_driver/pages/login/login_page.dart';
import 'package:lady_driver/pages/modify_password/modify_password_page.dart';
import 'package:lady_driver/pages/on_boarding/onboarding_page.dart';
import 'package:lady_driver/pages/splash/splash_page.dart';
import 'package:lady_driver/pages/verification_code/verification_code_page.dart';
import 'package:lady_driver/pages/welcome/welcome_page.dart';

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
      ];
}
