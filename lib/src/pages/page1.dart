import 'package:esqueleto/src/helpers/helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/blocs.dart';
import '../providers/providers.dart';

class Page1Page extends StatelessWidget {
  static const name = 'home-screen';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('text')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Hola',
            style: context.headlineMedium,
          ),
          SizedBox(width: double.infinity),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _changeTheme(context);
        },
        child: Icon(BlocProvider.of<PreferencesBloc>(context).state.isDarkMode
            ? Icons.brightness_3
            : Icons.brightness_7),
      ),
    );
  }

  //TODO este metodo irá junto con el widget que realice el cambio en un metodo privado
  void _changeTheme(BuildContext context) {
    final PreferencesBloc preferencesBloc = BlocProvider.of<PreferencesBloc>(context);
    final isDark = !preferencesBloc.state.isDarkMode;

    final themeProvider = ThemeProvider.of(context);
    final settings = themeProvider.settings.value;

    final newSettings = ThemeSettings(
      sourceColor: settings.sourceColor,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
    );
    ThemeSettingChange(settings: newSettings).dispatch(context);

    preferencesBloc.add(OnChangeDarkMode(isDark));
  }
}
