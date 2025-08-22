import 'package:flutter/material.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    required this.child,
    this.padding = const EdgeInsets.all(12),
    this.margin = const EdgeInsets.all(8),
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}
