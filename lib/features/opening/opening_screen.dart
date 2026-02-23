import 'package:flutter/material.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF6F4EF),
      body: Stack(
        children: [

          // Paper texture
          Positioned.fill(
            child: Opacity(
              opacity: 0.08,
              child: Image.asset(
                'assets/images/paper_texture.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Statue anchored bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: size.height * 0.12),
              child: Image.asset(
                'assets/images/statue.png',
                height: size.height * 0.42,
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Title slightly above center
          Align(
            alignment: const Alignment(0, -0.25),
            child: Text(
              "JimBro",
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.6,
                color: Color(0xFF3F51B5), // your blue
                fontFamily: 'Times New Roman', // placeholder serif feel
              ),
            ),
          ),
        ],
      ),
    );
  }
}
