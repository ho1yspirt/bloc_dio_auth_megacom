import 'package:bloc_final/ui/colors/app_gradients.dart';
import 'package:flutter/material.dart';

class GradientCircle extends StatelessWidget {
  const GradientCircle({
    super.key,
    required this.size,
  });
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppGradients.primary,
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
