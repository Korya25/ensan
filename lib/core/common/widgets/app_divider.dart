// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({
    this.thickness = 1,
    this.color = AppColors.textAndIconPrimary,
    super.key,
    this.showTitle = true,
    this.title,
  });
  final double thickness;
  final Color color;
  final bool? showTitle;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.textAndIconPrimary.withOpacity(0.3),
          ),
        ),
        if (showTitle == true)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextApp(
              text: title ?? 'OR',
              color: AppColors.textAndIconPrimary,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        Expanded(
          child: Container(
            height: 1,
            color: AppColors.textAndIconPrimary.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
