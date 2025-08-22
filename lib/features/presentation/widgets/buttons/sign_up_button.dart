import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/router/app_routes.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';
import 'package:ensan_app/features/presentation/controller/auth/auth_cubit.dart';
import 'package:ensan_app/features/presentation/controller/register/register_cubit.dart';
import 'package:ensan_app/features/presentation/controller/register/register_state.dart';
import 'package:ensan_app/features/presentation/widgets/shared/auth_error_message_widget.dart';

class SignUpButton extends StatefulWidget {
  const SignUpButton({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.usernameController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController usernameController;

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  String? currentError;
  void _handleSignUp() {
    if (widget.formKey.currentState?.validate() == true) {
      setState(() => currentError = null);
      context.read<RegisterCubit>().signUp(
        widget.emailController.text.trim(),
        widget.passwordController.text.trim(),
        widget.usernameController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Error Message
        AuthErrorMessageWidget(errorMessage: currentError),
        BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterError) {
              setState(() => currentError = state.message);
            } else if (state is RegisterSuccess) {
              // Update the global auth state
              context.read<AuthCubit>().authenticateUser(state.user);
              // Navigate to home screen
              context.goNamed(AppRoutes.home);
            }
          },
          builder: (context, state) {
            final isLoading = state is RegisterLoading;

            return CustomFadeInUp(
              duration: 1300,
              child: CustomButton(
                isLoading: isLoading,
                text: 'Sign Up',
                onTap: isLoading ? null : _handleSignUp,
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
