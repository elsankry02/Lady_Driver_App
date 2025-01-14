import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_driver/core/cached/cached_helper.dart';
import 'package:lady_driver/core/constant/string_manager.dart';
import 'package:lady_driver/core/models/enums_local_language.dart';
import 'package:lady_driver/core/router/router.dart';
import 'package:lady_driver/home/data/manger/app_language/app_language_cubit.dart';
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
    return BlocProvider(
      create: (context) =>
          AppLanguageCubit()..appLangFunc(EnumChangeLocalLanguage.intialStat),
      child: BlocBuilder<AppLanguageCubit, AppLanguageState>(
        builder: (context, state) {
          if (state is AppLanguageChange) {
            return MaterialApp.router(
              locale: Locale(state.isChange),
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
        },
      ),
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
