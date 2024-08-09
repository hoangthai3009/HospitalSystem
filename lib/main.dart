import 'dart:io';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'config/https.dart';
import 'pages/introduction_page.dart';
import 'pages/lookup_prescriptions_page.dart';
import 'pages/medical_examination_instructions_page.dart';
import 'pages/booking_page.dart';
import 'pages/minimap_page.dart';
import 'pages/navigation_page.dart';
import 'pages/policy_page.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: true),
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
      ),
      dark: ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: true),
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
      ),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'Adaptive Theme Demo',
        theme: theme,
        darkTheme: darkTheme,
        routes: {
          '/map': (context) => const MapPage(),
          '/medicalExaminationInstructions': (context) => const MedicalExaminationInstructionsPage(),
          '/booking': (context) => const BookingPage(),
          '/lookupPrescriptions': (context) => const LookupPrescriptionsPage(),
          '/introduction': (context) => const IntroductionPage(),
          '/home': (context) => const MainNavigationPage(),
          '/policy': (context) => const PolicyPage(),
        },
        debugShowCheckedModeBanner: false,
        home: const MainNavigationPage(),
      ),
    );
  }
}
