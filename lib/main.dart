import 'package:flutter/material.dart';
import 'package:lady_driver/core/cached/cached_helper.dart';
import 'package:lady_driver/core/constant/string_manager.dart';
import 'package:lady_driver/core/router/router.dart';
import 'package:lady_driver/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachedHelper.getInstance();
  runApp(const LadyDriver());
}

class LadyDriver extends StatelessWidget {
  const LadyDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router.config(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: localCallBack,
      theme: ThemeData(
        fontFamily: kTajawal,
      ),
      debugShowCheckedModeBanner: false,
    );
  }

  Locale localCallBack(Locale? local, Iterable<Locale> supportedLocales) {
    if (local == null) {
      return supportedLocales.last;
    }
    for (var supportedLocale in supportedLocales) {
      if (local.languageCode == supportedLocale.languageCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.last;
  }
}
