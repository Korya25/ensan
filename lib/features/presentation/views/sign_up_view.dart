import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/router/app_routes.dart';
import 'package:ensan_app/features/presentation/widgets/buttons/sign_up_button.dart';
import 'package:ensan_app/features/presentation/widgets/shared/auth_container.dart';
import 'package:ensan_app/features/presentation/widgets/shared/auth_fotter.dart';
import 'package:ensan_app/features/presentation/widgets/shared/auth_header.dart';
import 'package:ensan_app/features/presentation/widgets/form/sign_up_form.dart';
import 'package:ensan_app/features/presentation/widgets/shared/auth_spacer.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuthTopGap(space: 0.07.sh),

          const AuthHeader(
            title: 'Create Account',
            subtitle: 'Join us and start your journey today',
          ),

          AfterAuthHeaderGap(space: 0.05.sh),

          SignUpForm(
            formKey: _formKey,
            usernameController: _usernameController,
            emailController: _emailController,
            passwordController: _passwordController,
            confirmPasswordController: _confirmPasswordController,
          ),

          const SizedBox(height: 40),

          SignUpButton(
            formKey: _formKey,
            emailController: _emailController,
            passwordController: _passwordController,
            usernameController: _usernameController,
          ),

          const SizedBox(height: 30),

          CustomFadeInUp(
            duration: 1600,
            child: AuthFooter(
              text: 'Already have an account? ',
              linkText: 'Login',
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
