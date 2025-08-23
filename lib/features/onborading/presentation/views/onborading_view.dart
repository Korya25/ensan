import 'package:ensan_app/core/common/animations/animate_do.dart';
import 'package:ensan_app/core/common/widgets/app_divider.dart';
import 'package:ensan_app/core/common/widgets/custom_button.dart';
import 'package:ensan_app/core/common/widgets/text_app.dart';
import 'package:ensan_app/core/common/widgets/text_button_link.dart';
import 'package:ensan_app/core/constants/app_strings.dart';
import 'package:ensan_app/core/router/app_routes.dart';
import 'package:ensan_app/core/services/shared_pref/pref_keys.dart';
import 'package:ensan_app/core/services/shared_pref/shared_pref.dart';
import 'package:ensan_app/core/style/theme/app_colors.dart';
import 'package:ensan_app/features/onborading/widgets/app_logo_slogen_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OnboradingView extends StatelessWidget {
  const OnboradingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Hero(
              tag: AppHeroTags.appLogoSlogenNameHero,
              child: SizedBox(height: 0.5.sh, child: AppLogoSlogenNameWidget()),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                spacing: 20,
                children: [
                  const _LoginButtonWidget(),
                  CustomFadeInLeft(duration: 1800, child: AppDivider()),
                  const _ContinueAsGuestButtonWidget(),
                  const _SignUpRowWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// ------------------- Login Button -------------------
class _LoginButtonWidget extends StatelessWidget {
  const _LoginButtonWidget();

  @override
  Widget build(BuildContext context) {
    return CustomFadeInDown(
      duration: 2000,
      child: CustomButton(
        text: 'Log in using account',
        onTap: () {
          context.pushNamed(AppRoutes.login);
        },
        textColor: AppColors.textAndIconThritly,
        backgroundColor: AppColors.backgroundSecondary,
        enableBoreder: true,
      ),
    );
  }
}

/// ------------------- Continue As Guest Button -------------------
class _ContinueAsGuestButtonWidget extends StatelessWidget {
  const _ContinueAsGuestButtonWidget();

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 2000,
      child: CustomButton(
        text: 'Continue as guest',
        onTap: () {
          context.goNamed(AppRoutes.home);
          SharedPref.setBool(PrefKeys.guest, true);
        },
        textColor: AppColors.textAndIconThritly,
        backgroundColor: AppColors.backgroundSecondary,
        enableBoreder: true,
      ),
    );
  }
}

/// ------------------- Sign Up Row -------------------
class _SignUpRowWidget extends StatelessWidget {
  const _SignUpRowWidget();

  @override
  Widget build(BuildContext context) {
    return CustomFadeInUp(
      duration: 2200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextApp(
            text: 'New to ensan? ',
            type: TextAppType.bodySmall,
            color: AppColors.textAndIconPrimary,
            fontSize: 18,
          ),
          TextButtonLink(
            text: 'Sign up',
            onTap: () {
              context.pushNamed(AppRoutes.signUp);
            },
          ),
        ],
      ),
    );
  }
}
