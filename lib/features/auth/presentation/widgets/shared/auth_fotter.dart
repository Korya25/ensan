import 'package:flutter/material.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/common/widgets/text_button_link.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';

class AuthFooter extends StatelessWidget {
  const AuthFooter({
    required this.text,
    required this.linkText,
    required this.onTap,
    this.spacing = 4.0,
    this.textStyle,
    this.linkStyle,
    super.key,
  });

  final String text;
  final String linkText;
  final VoidCallback onTap;
  final double spacing;
  final TextStyle? textStyle;
  final TextStyle? linkStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: spacing,
        children: [
          TextApp(
            text: text,
            color: textStyle?.color ?? AppColors.textAndIconPrimary,
            fontSize: textStyle?.fontSize ?? 16,
            fontWeight: textStyle?.fontWeight,

            style: textStyle,
          ),
          TextButtonLink(
            text: linkText,
            onTap: onTap,
            color: linkStyle?.color ?? AppColors.primary,
          ),
        ],
      ),
    );
  }
}
