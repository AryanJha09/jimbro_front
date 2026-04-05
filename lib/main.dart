import 'package:flutter/material.dart';

// Correct package name
import 'package:jimbro/core/theme/app_colors.dart';
import 'package:jimbro/core/theme/app_text.dart';

import 'package:jimbro/features/splash/splash_screen.dart';
import 'package:jimbro/features/opening/opening_screen.dart';
import 'package:jimbro/features/profile/profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const JimBroApp());
}

class JimBroApp extends StatelessWidget {
  const JimBroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JimBro',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.accent,
        ),
        textTheme: const TextTheme(
          headlineLarge: AppText.largeTitle,
          titleLarge: AppText.title,
          bodyLarge: AppText.body,
          bodyMedium: AppText.body,
          labelLarge: AppText.button,
        ),
      ),

      initialRoute: '/splash',

      routes: {
        '/splash': (context) => const SplashScreen(),
        '/opening': (context) => const OpeningScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}