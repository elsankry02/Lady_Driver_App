part of 'app_language_cubit.dart';

@immutable
sealed class AppLanguageState {}

final class AppLanguageInitial extends AppLanguageState {}

final class AppLanguageChange extends AppLanguageState {
  final String isChange;

  AppLanguageChange({required this.isChange});
}
