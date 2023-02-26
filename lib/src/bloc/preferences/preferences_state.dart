part of 'preferences_bloc.dart';


@immutable
class PreferencesState {
  final bool isDarkMode;

  const PreferencesState({ required this.isDarkMode});

  PreferencesState copyWith({
    bool? isDarkMode,
  }) =>
      PreferencesState(
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}
