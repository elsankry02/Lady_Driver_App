import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/cached/cached_helper.dart';
import '../../../../core/models/enums_local_language.dart';

part 'app_language_state.dart';

class AppLanguageCubit extends Cubit<AppLanguageState> {
  AppLanguageCubit() : super(AppLanguageInitial());

  appLangFunc(EnumChangeLocalLanguage enumChangeLocalLanguage) {
    switch (enumChangeLocalLanguage) {
      case EnumChangeLocalLanguage.intialStat:
        if (CachedHelper.getString(key: 'lang') != null) {
          if (CachedHelper.getString(key: 'lang') == 'ar') {
            emit(AppLanguageChange(isChange: 'ar'));
          } else {
            emit(AppLanguageChange(isChange: 'en'));
          }
        }
      case EnumChangeLocalLanguage.arabicLanguage:
        CachedHelper.setString(key: 'lang', value: 'ar');
        emit(AppLanguageChange(isChange: 'ar'));

      case EnumChangeLocalLanguage.englishLanguage:
        CachedHelper.setString(key: 'lang', value: 'en');
        emit(AppLanguageChange(isChange: 'en'));
    }
  }
}
