import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: Stack(
        children: [

          /// ==============================
          /// SUBTLE STATUE BACKGROUND
          /// ==============================
          Positioned.fill(
            child: Opacity(
              opacity: 0.14,
              child: Image.asset(
                'assets/images/statue.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// Soft bottom fade for readability
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    AppColors.background,
                    AppColors.background.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),

          /// Paper grain texture
          Positioned.fill(
            child: Opacity(
              opacity: 0.06,
              child: Image.asset(
                'assets/images/paper_texture.png',
                fit: BoxFit.cover,
              ),
            ),
          ),

          /// ==============================
          /// MAIN CONTENT
          /// ==============================
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  const SizedBox(height: 40),

                  /// Today Label
                  const Text("Today", style: AppText.smallLabel),

                  const SizedBox(height: 16),

                  /// Log Pill (more refined)
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 54,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.92),
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Text(
                              "Log your session…",
                              style: AppText.body,
                            ),
                          ),
                          Icon(Icons.mic_none,
                              size: 20,
                              color: AppColors.textSecondary),
                          SizedBox(width: 14),
                          Icon(Icons.auto_awesome,
                              size: 20,
                              color: AppColors.textSecondary),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 36),

                  /// ==========================
                  /// SESSION CARD
                  /// ==========================
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.94),
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 30,
                          offset: const Offset(0, 12),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        const Text("Your session",
                            style: AppText.smallLabel),

                        const SizedBox(height: 12),

                        const Text("Push", style: AppText.title),

                        const SizedBox(height: 8),

                        const Text(
                          "Chest · Shoulders · Triceps",
                          style: AppText.smallLabel,
                        ),

                        const SizedBox(height: 28),

                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.accent,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                            ),
                            onPressed: () {},
                            child: const Text(
                              "Begin Workout",
                              style: AppText.button,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),

      /// ==============================
      /// BOTTOM NAV (Icons Only)
      /// ==============================
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.95),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 20,
              offset: const Offset(0, -4),
            )
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: 0,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: AppColors.accent,
          unselectedItemColor: AppColors.textSecondary,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart_outlined),
              activeIcon: Icon(Icons.bar_chart),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.restaurant_outlined),
              activeIcon: Icon(Icons.restaurant),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: "",
            ),
          ],
        ),
      ),
    );
  }
}
