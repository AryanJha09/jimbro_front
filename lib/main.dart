import 'package:flutter/material.dart';
import 'core/theme/app_colors.dart';
import 'core/theme/app_text.dart';
import 'features/opening/opening_screen.dart';

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
          surface: AppColors.background,
        ),

        textTheme: const TextTheme(
          headlineLarge: AppText.largeTitle,
          titleLarge: AppText.title,
          bodyLarge: AppText.body,
          bodyMedium: AppText.body,
          labelLarge: AppText.button,
        ),
      ),

      home: const OpeningScreen(),
    );
  }
}