import 'package:bloc_final/ui/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class GradientForeground extends StatelessWidget {
  const GradientForeground({
    super.key,
    this.child,
  });
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(40),
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: Container(
          height: 565,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(
              width: 1,
              color: AppColors.white.withOpacity(0.35),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
