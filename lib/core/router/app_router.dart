import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ensan_app/core/common/ui_tools/toast_message.dart';
import 'package:ensan_app/core/di/injuction.dart';
import 'package:ensan_app/core/router/app_routes.dart';
import 'package:ensan_app/core/router/app_transitions.dart';
import 'package:ensan_app/core/services/shared_pref/pref_keys.dart';
import 'package:ensan_app/core/services/shared_pref/shared_pref.dart';
import 'package:ensan_app/features/presentation/controller/auth/auth_cubit.dart';
import 'package:ensan_app/features/presentation/controller/auth/auth_state.dart';
import 'package:ensan_app/features/presentation/controller/forgot_pass_cubit/forgot_password_cubit.dart';
import 'package:ensan_app/features/presentation/controller/login/login_cubit.dart';
import 'package:ensan_app/features/presentation/controller/register/register_cubit.dart';
import 'package:ensan_app/features/presentation/views/forgot_password_view.dart';
import 'package:ensan_app/features/presentation/views/login_view.dart';
import 'package:ensan_app/features/presentation/views/sign_up_view.dart';
import 'package:ensan_app/features/presentation/widgets/buttons/auth_action_button.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    // ignore: unrelated_type_equality_checks
    initialLocation: SharedPref.getBool(PrefKeys.isLoggedIn) == true
        ? AppRoutes.settings
        : AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: AppRoutes.login,
        pageBuilder: (context, state) => AppTransitions.size(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => sl<LoginCubit>(),
            child: const LoginView(),
          ),
        ),
      ),
      // size
      GoRoute(
        path: AppRoutes.signUp,
        name: AppRoutes.signUp,
        pageBuilder: (context, state) => AppTransitions.size(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => sl<RegisterCubit>(),
            child: const SignUpView(),
          ),
        ),
      ),

      GoRoute(
        path: AppRoutes.forgotPassword,
        name: AppRoutes.forgotPassword,
        pageBuilder: (context, state) => AppTransitions.size(
          context: context,
          state: state,
          child: BlocProvider(
            create: (context) => sl<ForgotPasswordCubit>(),
            child: const ForgotPasswordView(),
          ),
        ),
      ),
      GoRoute(
        path: AppRoutes.settings,
        name: AppRoutes.settings,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: SettingsView(),
        ),
      ),
    ],
  );
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              ToastMessage.error(context, state.message);
            } else if (state is AuthUnauthenticated) {
              // Navigate to login screen
              context.goNamed(AppRoutes.login);
            }
          },
          builder: (context, state) {
            if (state is AuthAuthenticated) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome, ${state.user.email}!',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 20),
                  PrimaryActionButton(
                    text: 'Logout',
                    onTap: () {
                      context.read<AuthCubit>().signOut();
                    },
                  ),
                ],
              );
            }

            if (state is AuthLoading) {
              return const CircularProgressIndicator();
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
