import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/ui_tools/toast_message.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/router/app_routes.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';
import 'package:ensan_app/features/auth/presentation/controller/forgot_pass_cubit/forgot_password_cubit.dart';
import 'package:ensan_app/features/auth/presentation/controller/forgot_pass_cubit/forgot_password_state.dart';
import 'package:ensan_app/features/auth/presentation/widgets/shared/auth_error_message_widget.dart';

class ForgotPasswordButton extends StatefulWidget {
  const ForgotPasswordButton({
    super.key,
    required this.formKey,
    required this.emailController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  @override
  State<ForgotPasswordButton> createState() => _ForgotPasswordButtonState();
}

class _ForgotPasswordButtonState extends State<ForgotPasswordButton> {
  String? currentError;

  void _handleSendResetCode() {
    // امنع الإرسال لو لسه فيه Loading
    final cubit = context.read<ForgotPasswordCubit>();
    if (cubit.state is ForgotPasswordLoading) return;

    if (widget.formKey.currentState?.validate() == true) {
      setState(() => currentError = null);
      cubit.sendPasswordReset(widget.emailController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) async {
        if (state is ForgotPasswordError) {
          setState(() => currentError = state.message);
        } else if (state is ForgotPasswordSuccess) {
          ToastMessage.success(context, 'Password reset link sent');

          context.read<ForgotPasswordCubit>().reset();

          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              context.goNamed(AppRoutes.login);
            }
          });
        }
      },
      builder: (context, state) {
        final isLoading = state is ForgotPasswordLoading;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (currentError != null)
              AuthErrorMessageWidget(errorMessage: currentError!),

            CustomFadeInUp(
              duration: 1300,
              child: CustomButton(
                isLoading: isLoading,
                text: 'Send Link',
                onTap: isLoading ? null : _handleSendResetCode,
                backgroundColor: AppColors.primary,
                textColor: AppColors.textAndIconSecondary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                padding: const EdgeInsets.symmetric(vertical: 16),
                borderRadius: 12,
              ),
            ),
          ],
        );
      },
    );
  }
}
