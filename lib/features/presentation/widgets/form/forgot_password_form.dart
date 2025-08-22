import 'package:flutter/material.dart';
import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/features/presentation/widgets/fields/custom_fields.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({
    required this.formKey,
    required this.emailController,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomFadeInUp(
        duration: 1000,
        child: CustomEmailField(controller: emailController),
      ),
    );
  }
}
