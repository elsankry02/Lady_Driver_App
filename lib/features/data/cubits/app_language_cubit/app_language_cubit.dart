import 'package:bloc/bloc.dart';

import '../../../../core/cached/cached_helper.dart';
import '../../models/enums_local_language.dart';

part 'app_language_state.dart';

class AppLanguageCubit extends Cubit<AppLanguageState> {
  AppLanguageCubit() : super(AppLanguageInitial());

  appLangFunc(Localization localization) {
    switch (localization) {
      case Localization.intial:
        if (CachedHelper.getString(key: 'lang') != null) {
          if (CachedHelper.getString(key: 'lang') == 'ar') {
            emit(AppLanguageChange(isChange: 'ar'));
          } else {
            emit(AppLanguageChange(isChange: 'en'));
          }
        }
      case Localization.arabic:
        CachedHelper.setString(key: 'lang', value: 'ar');
        emit(AppLanguageChange(isChange: 'ar'));

      case Localization.english:
        CachedHelper.setString(key: 'lang', value: 'en');
        emit(AppLanguageChange(isChange: 'en'));
    }
  }
}
