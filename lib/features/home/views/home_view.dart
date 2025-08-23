import 'package:ensan_app/core/common/ui_tools/toast_message.dart';
import 'package:ensan_app/core/extensions/context_extension.dart';
import 'package:ensan_app/core/router/app_routes.dart';
import 'package:ensan_app/features/auth/presentation/controller/auth/auth_cubit.dart';
import 'package:ensan_app/features/auth/presentation/controller/auth/auth_state.dart';
import 'package:ensan_app/features/auth/presentation/widgets/buttons/auth_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home View')),
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

            if (context.isGuest) {
              return const Text(
                'Welcome guest',
                style: TextStyle(color: Colors.green),
              );
            }

            return const Text('Please login');
          },
        ),
      ),
    );
  }
}
