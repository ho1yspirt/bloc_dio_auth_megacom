import 'package:bloc_final/ui/colors/app_colors.dart';
import 'package:bloc_final/ui/fonts/app_fonts.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    this.controller,
    this.onChanged,
  });
  final String title;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: AppFonts.w600s15.copyWith(color: AppColors.white),
      cursorColor: AppColors.white,
      decoration: InputDecoration(
        label: Text(
          title,
          style: AppFonts.w600s15.copyWith(color: AppColors.white),
        ),
        filled: true,
        fillColor: AppColors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
