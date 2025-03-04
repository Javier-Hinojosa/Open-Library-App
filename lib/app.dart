import 'package:flutter/material.dart';
import 'package:open_library/app/providers/theme.provider.dart';
import 'package:open_library/app/services/navigation.service.dart';
import 'package:open_library/core/routes/providers.dart';
import 'package:open_library/core/routes/routes.dart';
import 'package:open_library/core/theme/app_dark.theme.dart';
import 'package:open_library/core/theme/app_light.theme.dart';
import 'package:open_library/core/values/globals.dart';
import 'package:provider/provider.dart';

import 'core/routes/pages.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (_, mode, child) {
          return MultiProvider(
              providers: Providers.providers,
              child: MaterialApp(
                locale:  const Locale(Globals.currentLocale, Globals.currentCountry),
                  debugShowCheckedModeBanner: false,
                  navigatorKey: NavigationService.navigatorKey,
                  theme: lightTheme,
                  darkTheme: appDarkTheme,
                  themeMode: mode.darkTheme == true ? ThemeMode.dark : ThemeMode.light,
                  initialRoute: Routes.splash,
                routes: pages));
        }));
  }
}