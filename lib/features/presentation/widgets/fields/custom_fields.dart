import 'package:flutter/material.dart';
import 'package:ensan_app/core/common/widgets/custom_text_form_field.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';
import 'package:ensan_app/core/utils/validator.dart';

/// ------------------ Email ------------------
class CustomEmailField extends StatelessWidget {
  const CustomEmailField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: 'Email',
      keyboardType: TextInputType.emailAddress,
      validator: Validator.email,
      inputFormatters: [NoArabicInputFormatter()],
    );
  }
}

/// ------------------ Username ------------------
class CustomUsernameField extends StatelessWidget {
  const CustomUsernameField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: 'Username',
      validator: Validator.username,
      inputFormatters: [NoArabicInputFormatter()],
    );
  }
}

/// ------------------ Password ------------------
class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({required this.controller, super.key});
  final TextEditingController controller;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      hintText: 'Password',
      obscureText: _obscureText,
      validator: Validator.password,
      inputFormatters: [NoArabicInputFormatter()],

      suffixIcon: IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: AppColors.primary,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      ),
    );
  }
}
