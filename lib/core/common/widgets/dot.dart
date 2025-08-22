import 'package:flutter/material.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';

class Dot extends StatelessWidget {
  const Dot({
    this.size = 10,
    this.color = AppColors.textAndIconPrimary,
    super.key,
  });

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
