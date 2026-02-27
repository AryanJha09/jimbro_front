import 'package:flutter/material.dart';
import '../loading/loading_screen.dart'; // Adjust path as needed

class OpeningScreen extends StatefulWidget {
  const OpeningScreen({super.key});

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  @override
  void initState() {
    super.initState();
    // Hold the exact native layout for 800ms to absorb the iOS zoom, 
    // then execute a museum-grade fade to the loader.
    Future.delayed(const Duration(milliseconds: 800), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => const LoadingScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                // Use easeInOutCubic for that weighted, premium Apple feel
                opacity: CurvedAnimation(parent: animation, curve: Curves.easeInOutCubic),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 800),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F4EF), // Museum paper hex
      body: Center(
        child: SizedBox(
          width: 200, // This MUST exactly match your Xcode Storyboard constraint
          height: 200,
          child: Image.asset(
            'assets/images/plate_logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}