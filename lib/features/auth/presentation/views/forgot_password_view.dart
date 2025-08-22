import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/router/app_routes.dart';
import 'package:ensan_app/features/auth/presentation/widgets/buttons/forgot_password_button.dart';
import 'package:ensan_app/features/auth/presentation/widgets/shared/auth_container.dart';
import 'package:ensan_app/features/auth/presentation/widgets/shared/auth_fotter.dart';
import 'package:ensan_app/features/auth/presentation/widgets/shared/auth_header.dart';
import 'package:ensan_app/features/auth/presentation/widgets/form/forgot_password_form.dart';
import 'package:ensan_app/features/auth/presentation/widgets/shared/auth_spacer.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthTopGap(),

          const AuthHeader(
            title: 'Forgot Password?',
            subtitle:
                'Enter your email address and we\'ll send you a reset link',
            icon: Icons.lock_reset,
          ),

          AfterAuthHeaderGap(),

          ForgotPasswordForm(
            formKey: _formKey,
            emailController: _emailController,
          ),

          const SizedBox(height: 30),
          ForgotPasswordButton(
            formKey: _formKey,
            emailController: _emailController,
          ),

          const SizedBox(height: 30),

          CustomFadeInUp(
            duration: 1400,
            child: AuthFooter(
              text: 'Remember your password? ',
              linkText: 'Back to Login',
              onTap: () {
                context.goNamed(AppRoutes.login);
              },
            ),
          ),
        ],
      ),
    );
  }
}
