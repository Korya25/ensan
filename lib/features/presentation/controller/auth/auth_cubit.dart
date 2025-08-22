import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ensan_app/features/data/model/user_model.dart';
import 'package:ensan_app/features/data/repositories/auth_repository.dart';
import 'package:ensan_app/features/presentation/controller/auth/auth_state.dart';

// Auth Cubit
class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit(this._authRepository) : super(AuthInitial());

  Future<void> checkAuthStatus() async {
    emit(AuthLoading());
    try {
      final isLoggedIn = await _authRepository.isUserLoggedIn();
      if (isLoggedIn) {
        final user = await _authRepository.getCurrentUser();
        if (user != null) {
          emit(AuthAuthenticated(user));
        } else {
          emit(AuthUnauthenticated());
        }
      } else {
        emit(AuthUnauthenticated());
      }
    } catch (e) {
      emit(AuthUnauthenticated());
    }
  }

  Future<void> signOut() async {
    emit(AuthLoading());
    try {
      await _authRepository.signOut();
      emit(AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void authenticateUser(UserModel user) {
    emit(AuthAuthenticated(user));
  }
}
