import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smart_core_mobile/routes/home_routes.dart';
import 'package:smart_core_mobile/routes/navigation.dart';

import 'core/injection/injection.dart';
import 'home/src/screens/splash_screen/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  final ThemeMode themeMode = ThemeMode.system;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Smart-ix',
      navigatorKey: getIt<NavigationService>().navigatorKey,
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: ThemeData(
        fontFamily: 'Nato Sans',
        textSelectionTheme: const TextSelectionThemeData(
          // Set Up for TextFields
          cursorColor: Colors.grey,
          selectionColor: Colors.blueGrey,
        ),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFC84040),
          error: Color(0xFFB00020),
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          onBackground: Colors.black,
          onError: Colors.white,
          brightness: Brightness.light,
        ),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            fontSize: 32,
            color: Color(0xFF464646),
          ),
          headline2: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Color(0xFF464646),
          ),
          headline3: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Color(0xFF464646),
          ),
          headline4: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Color(0xFFBDBDBD),
          ),
          headline5: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Color(0xFFBDBDBD),
          ),
          headline6: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Color(0xFF464646),
          ),
        ),
      ),
      routes: routes,
      home: const SplashScreen(),
    );
  }
}