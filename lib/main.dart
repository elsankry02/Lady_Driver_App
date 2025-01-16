import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cached/cached_helper.dart';
import 'core/constant/string_manager.dart';
import 'core/models/enums_local_language.dart';
import 'core/router/router.dart';
import 'home/data/manger/app_language/app_language_cubit.dart';
import 'l10n/app_localizations.dart';

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
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: kTajawal),
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
            );
          }
          return MaterialApp.router(
            routerConfig: router.config(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: kTajawal),
            supportedLocales: AppLocalizations.supportedLocales,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
          );
        },
      ),
    );
  }
}
