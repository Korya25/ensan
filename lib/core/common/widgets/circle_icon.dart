import 'package:flutter/material.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    required this.icon,
    this.size = 50,
    this.iconColor = AppColors.primary,
    this.backgroundColor = AppColors.backgroundSecondary,
    this.onTap,
    super.key,
  });

  final IconData icon;
  final double size;
  final Color iconColor;
  final Color backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(icon, color: iconColor, size: size * 0.5),
        ),
      ),
    );
  }
}
