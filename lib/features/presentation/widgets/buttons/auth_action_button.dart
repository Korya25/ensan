// Primary Action Button
import 'package:flutter/material.dart';
import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';

class PrimaryActionButton extends StatelessWidget {
  const PrimaryActionButton({
    required this.text,
    required this.onTap,
    this.duration = 1300,
    super.key,
  });

  final String text;
  final Function()? onTap;
  final int duration;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: duration,
      child: CustomButton(
        text: text,
        onTap: onTap,
        backgroundColor: AppColors.primary,
        textColor: AppColors.textAndIconPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        padding: const EdgeInsets.symmetric(vertical: 16),
        borderRadius: 12,
      ),
    );
  }
}
