import 'package:flutter/material.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';

class AuthErrorMessageWidget extends StatelessWidget {
  final String? errorMessage;
  final EdgeInsets? margin;

  const AuthErrorMessageWidget({super.key, this.errorMessage, this.margin});

  @override
  Widget build(BuildContext context) {
    if (errorMessage == null || errorMessage!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextApp(
        text: errorMessage!,
        type: TextAppType.bodySmall,
        color: AppColors.red,
        textOverflow: TextOverflow.ellipsis,
        fontSize: 14,
        letterSpacing: 1,

        fontWeight: FontWeight.w700,
        maxLines: 2,
      ),
    );
  }
}
