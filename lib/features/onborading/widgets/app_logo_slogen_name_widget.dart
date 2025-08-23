import 'package:ensan_app/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

class AppLogoSlogenNameWidget extends StatelessWidget {
  const AppLogoSlogenNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // اللوجو
        Image.asset(AppAssets.appLogoSlogenName, height: 120),

        const SizedBox(height: 8),

        // إنسان
        Text(
          'إنسان',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
          
          ),
          textAlign: TextAlign.center,
        ),

        // ensan
        Text(
          'ensan',
          style: Theme.of(
            context,
          ).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w500),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 6),

        // بني جيل .. يبني حياة
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'يبني حياة .. ',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              'نبني جيل  ',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                color: Colors.green,
                fontFamily: 'Aria0',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
