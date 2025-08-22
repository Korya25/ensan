import 'package:flutter/material.dart';
import 'package:ensan_app/core/common/ui_tools/loading_overlay.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    this.onTap,
    this.backgroundColor = AppColors.backgroundSecondary,
    this.textColor,
    this.textType = TextAppType.bodyMedium,
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.borderRadius = 12,
    super.key,
    this.isLoading,
    this.child,
    this.enableBoreder = false,
    this.borderColor,
  });

  final String text;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final Color? textColor;
  final TextAppType textType;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;
  final bool? isLoading;
  final Widget? child;
  final bool? enableBoreder;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          border: enableBoreder == true
              ? Border.all(
                  color: borderColor ?? AppColors.primary,
                  width: 1,
                  //
                )
              : null,
        ),
        child:
            child ??
            Center(
              child: isLoading == true
                  ? LoadingIndicator()
                  : TextApp(
                      text: text,
                      type: textType,
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
            ),
      ),
    );
  }
}
