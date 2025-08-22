import 'package:flutter/material.dart';
import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/features/presentation/widgets/fields/custom_fields.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    super.key,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomFadeInRight(
            duration: 1000,
            child: CustomEmailField(controller: emailController),
          ),
          const SizedBox(height: 20),
          CustomFadeInLeft(
            duration: 1100,
            child: CustomPasswordField(controller: passwordController),
          ),
        ],
      ),
    );
  }
}
