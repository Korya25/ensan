import 'package:flutter/material.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: child,
        ),
      ),
    );
  }
}
