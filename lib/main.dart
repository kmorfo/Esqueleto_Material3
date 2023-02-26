import 'package:dynamic_color/dynamic_color.dart';
import 'package:esqueleto/src/pages/page1.dart';
import 'package:esqueleto/src/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/bloc/blocs.dart';
import 'src/preferences/preferences.dart';
import 'src/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Inicializamos las shared preferences para cargar el tipo theme establecido
  await Preferences.initPreferences();

  runApp(MultiBlocProvider(
    providers: [BlocProvider(create: (context) => PreferencesBloc(), lazy: false)],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = BlocProvider.of<PreferencesBloc>(context).state.isDarkMode;

    //A partir del ThemeMode podemos seleccionar el tema, ThemeMode.system  ThemeMode.dark ...
    final settings = ValueNotifier(ThemeSettings(
      sourceColor: Colors.redAccent,
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
    ));

    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) => ThemeProvider(
          lightDynamic: lightDynamic,
          darkDynamic: darkDynamic,
          settings: settings,
          child: NotificationListener<ThemeSettingChange>(
            onNotification: (notification) {
              settings.value = notification.settings;
              return true;
            },
            child: ValueListenableBuilder<ThemeSettings>(
              valueListenable: settings,
              builder: (context, _, __) {
                final theme = ThemeProvider.of(context);
                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  title: 'Flutter dinamic color',
                  theme: theme.light(settings.value.sourceColor),
                  darkTheme: theme.dark(settings.value.sourceColor),
                  themeMode: theme.themeMode(),
                  routerConfig: appRouter,
                  // builder: (context, child) {
                  //   return Page1Page();// Aqui podremos llamar las distintas vistas
                  // },
                );
              },
            ),
          )),
    );
  }
}

