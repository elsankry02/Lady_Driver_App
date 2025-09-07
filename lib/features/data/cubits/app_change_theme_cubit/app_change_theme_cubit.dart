import 'package:bloc/bloc.dart';

part 'app_change_theme_state.dart';

class AppChangeThemeCubit extends Cubit<AppChangeThemeState> {
  AppChangeThemeCubit() : super(AppChangeThemeInitial());
}
