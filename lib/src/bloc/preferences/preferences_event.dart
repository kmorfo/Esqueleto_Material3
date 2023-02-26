part of 'preferences_bloc.dart';

@immutable
abstract class PreferencesEvent {}

class OnChangeDarkMode extends PreferencesEvent {
  final bool isDark;
  OnChangeDarkMode( this.isDark);
}
