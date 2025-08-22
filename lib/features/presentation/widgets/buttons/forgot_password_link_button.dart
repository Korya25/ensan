import 'package:flutter/material.dart';
import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/text_button_link.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';

class ForgotPasswordLinkButton extends StatelessWidget {
  const ForgotPasswordLinkButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 1200,
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButtonLink(
          text: 'Forgot Password?',
          onTap: onTap,
          color: AppColors.primary,
        ),
      ),
    );
  }
}
