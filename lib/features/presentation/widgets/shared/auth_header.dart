import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/circle_icon.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    required this.title,
    required this.subtitle,
    super.key,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.iconBackgroundColor,
  });

  final String title;
  final String subtitle;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final Color? iconBackgroundColor;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 800,
      child: Column(
        spacing: 8,
        children: [
          if (icon != null)
            CircleIcon(
              icon: icon!,
              size: iconSize ?? 80,

              backgroundColor:
                  iconBackgroundColor ?? AppColors.primary.withAlpha(50),
              iconColor: iconColor ?? AppColors.primary,
            ),
          if (icon != null) Gap(5),
          TextApp(
            text: title,
            type: TextAppType.bodyLarge,
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: AppColors.textAndIconPrimary,
            textAlign: TextAlign.center,
          ),
          TextApp(
            text: subtitle,
            type: TextAppType.bodyMedium,
            color: AppColors.textAndIconPrimary,
            fontSize: 17,
            fontWeight: FontWeight.w400,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
