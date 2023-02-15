import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  EditProfile.routeName: (context) => const EditProfile(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  SavingsScreen.routeName: (context) => const SavingsScreen(),
  SetEventScreen.routeName: (context) => const SetEventScreen(),
  SettingScreen.routeName: (context) => const SettingScreen(),
  SmartAC.routeName: (context) => const SmartAC(),
  SmartFan.routeName: (context) => const SmartFan(),
  SmartTV.routeName: (context) => const SmartTV(),
  SmartLight.routeName: (context) => const SmartLight(),
  SmartSpeaker.routeName: (context) => const SmartSpeaker(),
  SplashScreen.routeName: (context) => const SplashScreen(),
  StatsScreen.routeName: (context) => const StatsScreen(),
  MyListScreen.routeName: (context) => const MyListScreen()
};
