import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../preferences/preferences.dart';


part 'preferences_event.dart';
part 'preferences_state.dart';

class PreferencesBloc extends Bloc<PreferencesEvent, PreferencesState> {

  PreferencesBloc() : super( PreferencesState( isDarkMode:Preferences.darkTheme)) {
    
    on<OnChangeDarkMode>(_onChangeDarkMode);
  }

  void _onChangeDarkMode(OnChangeDarkMode event, Emitter<PreferencesState> emit) {
    emit(state.copyWith(isDarkMode: event.isDark));
    Preferences.darkTheme=event.isDark;
  }

  
}
