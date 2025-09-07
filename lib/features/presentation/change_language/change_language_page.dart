import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/cached/cached_helper.dart';
import '../../../core/constant/app_colors.dart';
import '../../../l10n/app_localizations.dart';
import '../../data/cubits/app_language_cubit/app_language_cubit.dart';
import '../../data/models/enums_local_language.dart';

@RoutePage()
class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({super.key});

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  static const WidgetStateProperty<Icon> thumbIcon =
      WidgetStateProperty<Icon>.fromMap(
    <WidgetStatesConstraint, Icon>{
      WidgetState.selected: Icon(
        Icons.check,
        color: AppColors.kPrimaryColor,
      ),
      WidgetState.any: Icon(
        Icons.check,
        color: AppColors.kPrimaryColor,
      ),
    },
  );
  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLocalizations.changeLanguage,
          style: textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
          child: Column(
            children: [
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //! العربيه
                    Text(
                      'العربية  🇪🇬',
                      style: textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                    //! Switch
                    Switch(
                      thumbIcon: thumbIcon,
                      activeThumbColor: Colors.white,
                      activeTrackColor: const Color(0xff78767b),
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: const Color(0xff78767b),
                      value: CachedHelper.getBool(key: 'isSelected') ?? false,
                      onChanged: (value) async {
                        await CachedHelper.setBool(
                            key: 'isSelected', value: value);
                        if (value == true) {
                          setState(() {
                            context
                                .read<AppLanguageCubit>()
                                .appLangFunc(Localization.english);
                          });
                        } else {
                          setState(() {
                            context
                                .read<AppLanguageCubit>()
                                .appLangFunc(Localization.arabic);
                          });
                        }
                        return;
                      },
                    ),
                    //! english
                    Text(
                      'English  🇺🇸',
                      style: textTheme.titleMedium!
                          .copyWith(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
