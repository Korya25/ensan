import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ensan_app/features/data/repositories/auth_repository.dart';
import 'package:ensan_app/features/presentation/controller/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginInitial());

  Future<void> signIn(String email, String password) async {
    emit(LoginLoading());
    try {
      final user = await _authRepository.signIn(email, password);
      emit(LoginSuccess(user));
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  void reset() => emit(LoginInitial());
}
