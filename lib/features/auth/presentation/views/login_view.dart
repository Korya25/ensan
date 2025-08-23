import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/services/shared_pref/pref_keys.dart';
import 'package:ensan_app/core/services/shared_pref/shared_pref.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/router/app_routes.dart';
import 'package:ensan_app/features/auth/presentation/widgets/buttons/login_button.dart';
import 'package:ensan_app/features/auth/presentation/widgets/shared/auth_container.dart';
import 'package:ensan_app/features/auth/presentation/widgets/shared/auth_fotter.dart';
import 'package:ensan_app/features/auth/presentation/widgets/shared/auth_header.dart';
import 'package:ensan_app/features/auth/presentation/widgets/buttons/forgot_password_link_button.dart';
import 'package:ensan_app/features/auth/presentation/widgets/form/login_form.dart';
import 'package:ensan_app/features/auth/presentation/widgets/shared/auth_spacer.dart';
import 'package:ensan_app/features/auth/presentation/widgets/shared/auth_error_message_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? currentError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthTopGap(),

          AuthHeader(
            title: 'Welcome Back',
            subtitle: 'Sign in to continue to your account',
          ),

          AfterAuthHeaderGap(),

          LoginForm(
            formKey: _formKey,
            emailController: _emailController,
            passwordController: _passwordController,
          ),

          const SizedBox(height: 16),

          ForgotPasswordLinkButton(
            onTap: () {
              context.goNamed(AppRoutes.forgotPassword);
              currentError == '';
            },
          ),

          const SizedBox(height: 30),

          // Error Message
          AuthErrorMessageWidget(errorMessage: currentError),

          LoginButton(
            formKey: _formKey,
            emailController: _emailController,
            passwordController: _passwordController,
          ),

          const SizedBox(height: 10),

          CustomFadeInUp(
            duration: 1600,
            child: AuthFooter(
              text: "Don't have an account? ",
              linkText: 'Sign Up',
              onTap: () {
                context.goNamed(AppRoutes.signUp);
              },
            ),
          ),
          const SizedBox(height: 10),

          CustomFadeInUp(
            duration: 1600,
            child: CustomButton(
              text: 'Continue as guest',
              onTap: () {
                context.goNamed(AppRoutes.settings);
                SharedPref.setBool(PrefKeys.guest, true);
              },
              textColor: AppColors.textAndIconThritly,
              backgroundColor: AppColors.backgroundSecondary,
              enableBoreder: true,
            ),
          ),
        ],
      ),
    );
  }
}
