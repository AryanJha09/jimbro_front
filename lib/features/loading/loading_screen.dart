import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../home/home_screen.dart';
import '../../core/theme/app_text.dart';
import '../../core/theme/app_colors.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late String _selectedTip;

  final List<String> _tips = [
    "Consistency beats intensity.",
    "Progress is built in quiet reps.",
    "Strength is earned slowly.",
    "Train with intention, not ego.",
    "Recovery is part of growth.",
  ];

  @override
  void initState() {
    super.initState();

    // Constant-speed premium spin
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // Random tip each launch
    final shuffled = List<String>.from(_tips)..shuffle();
    _selectedTip = shuffled.first;

    // Simulated async barrier
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        _transitionToHome();
      }
    });
  }

  void _transitionToHome() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const HomeScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          final fade =
              CurvedAnimation(parent: animation, curve: Curves.easeOutQuart);
          final scale =
              Tween<double>(begin: 0.985, end: 1.0).animate(fade);

          return FadeTransition(
            opacity: fade,
            child: ScaleTransition(scale: scale, child: child),
          );
        },
        transitionDuration: const Duration(milliseconds: 700),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          /// Center Logo Spinner (with premium depth)
          Center(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 28,
                          spreadRadius: 1,
                          offset: const Offset(0, 14),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'assets/images/plate_logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              },
            ),
          ),

          /// Bottom Tip Section
          Positioned(
            bottom: 72,
            left: 32,
            right: 32,
            child: Column(
              children: [
                const Text(
                  "Tip",
                  style: AppText.label,
                ),
                const SizedBox(height: 12),
                Text(
                  _selectedTip,
                  textAlign: TextAlign.center,
                  style: AppText.tip,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}