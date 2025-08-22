
/*
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
*/