import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTopGap extends StatelessWidget {
  const AuthTopGap({super.key, this.space});
  final double? space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space ?? 0.1.sh);
  }
}

class AfterAuthHeaderGap extends StatelessWidget {
  const AfterAuthHeaderGap({super.key, this.space});
  final double? space;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: space ?? 0.05.sh);
  }
}
