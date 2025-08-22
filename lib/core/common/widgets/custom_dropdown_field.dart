import 'package:flutter/material.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';

class CustomDropdownField<T> extends StatelessWidget {
  const CustomDropdownField({
    required this.items,
    required this.value,
    required this.onChanged,
    this.hint,
    this.backgroundColor = AppColors.backgroundSecondary,
    super.key,
  });

  final List<DropdownMenuItem<T>> items;
  final T? value;
  final ValueChanged<T?> onChanged;
  final String? hint;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButton<T>(
        value: value,
        hint: hint != null ? Text(hint!) : null,
        items: items,
        onChanged: onChanged,
        underline: const SizedBox(),
        isExpanded: true,
      ),
    );
  }
}
