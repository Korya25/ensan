import 'package:flutter/material.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';
import 'text_app.dart';

class TextButtonLink extends StatelessWidget {
  const TextButtonLink({
    required this.text,
    required this.onTap,
    this.color = AppColors.primary,
    super.key,
  });

  final String text;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextApp(
        text: text,
        type: TextAppType.bodyMedium,
        color: color,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
