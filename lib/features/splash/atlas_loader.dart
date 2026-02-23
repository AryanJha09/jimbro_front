import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class AtlasLoader extends StatefulWidget {
  const AtlasLoader({super.key});

  @override
  State<AtlasLoader> createState() => _AtlasLoaderState();
}

class _AtlasLoaderState extends State<AtlasLoader>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _offset;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _offset = Tween<double>(begin: 0, end: -40)
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Center(
        child: AnimatedBuilder(
          animation: _offset,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _offset.value),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.fitness_center,
                    size: 64,
                    color: Colors.black26,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
