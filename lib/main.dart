import 'package:flutter/material.dart';
import 'package:jim_front/core/theme/app_colors.dart';
import 'package:jim_front/core/theme/app_text.dart';
import 'package:jim_front/features/opening/opening_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const JimBroApp());
}

class JimBroApp extends StatelessWidget {
  const JimBroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      /// App Theme
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,

        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.accent,
          background: AppColors.background,
        ),

        textTheme: TextTheme(
          headlineLarge: AppText.title.copyWith(
            fontSize: 42,
          ),
          bodyLarge: AppText.body,
        ),
      ),

      /// Initial Screen
      home: const OpeningScreen(),
    );
  }
}
