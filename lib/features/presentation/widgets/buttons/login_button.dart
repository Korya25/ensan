import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/router/app_routes.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';
import 'package:ensan_app/features/presentation/controller/auth/auth_cubit.dart';
import 'package:ensan_app/features/presentation/controller/login/login_cubit.dart';
import 'package:ensan_app/features/presentation/controller/login/login_state.dart';
import 'package:ensan_app/features/presentation/widgets/shared/auth_error_message_widget.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  String? currentError;

  void _handleLogin() {
    if (widget.formKey.currentState?.validate() == true) {
      setState(() => currentError = null);
      context.read<LoginCubit>().signIn(
        widget.emailController.text.trim(),
        widget.passwordController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Error Message
        AuthErrorMessageWidget(errorMessage: currentError),
        const SizedBox(height: 10),

        BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginError) {
              setState(() => currentError = state.message);
            } else if (state is LoginSuccess) {
              context.read<AuthCubit>().authenticateUser(state.user);
              context.goNamed(AppRoutes.settings);
            }
          },
          builder: (context, state) {
            final isLoading = state is LoginLoading;
            return CustomFadeInUp(
              duration: 1300,
              child: CustomButton(
                isLoading: isLoading,
                text: 'Login',
                onTap: isLoading ? null : _handleLogin,
                backgroundColor: AppColors.primary,
                textColor: AppColors.textAndIconSecondary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                padding: const EdgeInsets.symmetric(vertical: 16),
                borderRadius: 12,
              ),
            );
          },
        ),
      ],
    );
  }
}
