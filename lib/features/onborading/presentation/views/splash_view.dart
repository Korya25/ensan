import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/constants/app_strings.dart';
import 'package:ensan_app/core/router/app_routes.dart';
import 'package:ensan_app/features/onborading/widgets/app_logo_slogen_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.pushNamed(AppRoutes.onborading);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Hero(
          tag: AppHeroTags.appLogoSlogenNameHero,
          child: CustomFadeInDown(
            duration: 1000,
            child: AppLogoSlogenNameWidget(),
          ),
        ),
      ),
    );
  }
}
