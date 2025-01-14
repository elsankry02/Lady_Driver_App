import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lady_driver/core/cached/cached_helper.dart';
import 'package:lady_driver/core/constant/color_manger.dart';
import 'package:lady_driver/core/models/enums_local_language.dart';
import 'package:lady_driver/home/data/manger/app_language/app_language_cubit.dart';
import 'package:lady_driver/l10n/app_localizations.dart';

@RoutePage()
class ChangeLanguagePage extends StatefulWidget {
  const ChangeLanguagePage({super.key});

  @override
  State<ChangeLanguagePage> createState() => _ChangeLanguagePageState();
}

class _ChangeLanguagePageState extends State<ChangeLanguagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context)!.changeLanguage),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      ' 🇪🇬 العربيه',
                    ),
                  ),
                  Switch(
                    activeColor: Colors.black,
                    activeTrackColor: ColorManger.kBorderColor,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: Colors.blue,
                    value: CachedHelper.getBool(key: 'isSelected')!,
                    onChanged: (value) {
                      CachedHelper.setBool(key: 'isSelected', value: value);
                      if (value == true) {
                        setState(() {
                          context.read<AppLanguageCubit>().appLangFunc(
                              EnumChangeLocalLanguage.englishLanguage);
                        });
                      } else {
                        setState(() {
                          context.read<AppLanguageCubit>().appLangFunc(
                              EnumChangeLocalLanguage.arabicLanguage);
                        });
                      }
                      context.router.maybePop();
                    },
                  ),
                  const Text(
                    'English 🇺🇸',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
