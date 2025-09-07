import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_driver/core/constant/endpoint.dart';
import 'package:lady_driver/core/router/router.dart';
import 'package:lady_driver/features/data/cubits/app_language_cubit/app_language_cubit.dart';
import 'package:lady_driver/features/data/models/enums_local_language.dart';
import 'package:lady_driver/l10n/app_localizations.dart';

class LadyDriver extends StatelessWidget {
  const LadyDriver({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppLanguageCubit()..appLangFunc(Localization.intial),
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
