import 'package:bloc_final/ui/colors/app_colors.dart';
import 'package:bloc_final/ui/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final void Function() onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.white.withOpacity(0.2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        splashFactory: InkSparkle.splashFactory,
      ),
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Text(
          title,
          style: AppFonts.w600s15.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
