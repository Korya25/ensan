import 'package:ensan_app/features/home/views/home_view.dart';
import 'package:ensan_app/help.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ensan_app/core/di/injuction.dart';
import 'package:ensan_app/core/router/app_routes.dart';
import 'package:ensan_app/core/router/app_transitions.dart';
import 'package:ensan_app/core/services/shared_pref/pref_keys.dart';
import 'package:ensan_app/core/services/shared_pref/shared_pref.dart';
import 'package:ensan_app/features/auth/presentation/controller/forgot_pass_cubit/forgot_password_cubit.dart';
import 'package:ensan_app/features/auth/presentation/controller/login/login_cubit.dart';
import 'package:ensan_app/features/auth/presentation/controller/register/register_cubit.dart';
import 'package:ensan_app/features/auth/presentation/views/forgot_password_view.dart';
import 'package:ensan_app/features/auth/presentation/views/login_view.dart';
import 'package:ensan_app/features/auth/presentation/views/sign_up_view.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    // ignore: unrelated_type_equality_checks
    initialLocation: SharedPref.getBool(PrefKeys.isLoggedIn) == true
        ? AppRoutes.home
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
        path: AppRoutes.home,
        name: AppRoutes.home,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: HomeView(),
        ),
      ),
      /* GoRoute(
        path: AppRoutes.settings,
        name: AppRoutes.settings,
        pageBuilder: (context, state) => AppTransitions.slideFromRight(
          context: context,
          state: state,
          child: SettingsView(),
        ),
      ),*/
    ],
  );
}
