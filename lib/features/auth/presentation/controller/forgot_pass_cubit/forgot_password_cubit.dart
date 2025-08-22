import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ensan_app/features/auth/data/repositories/auth_repository.dart';
import 'package:ensan_app/features/auth/presentation/controller/forgot_pass_cubit/forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final AuthRepository _authRepository;

  ForgotPasswordCubit(this._authRepository) : super(ForgotPasswordInitial());

  Future<void> sendPasswordReset(String email) async {
    emit(ForgotPasswordLoading());
    try {
      await _authRepository.sendPasswordReset(email);
      emit(ForgotPasswordSuccess(email));
    } catch (e) {
      emit(ForgotPasswordError(e.toString()));
    }
  }

  void reset() => emit(ForgotPasswordInitial());
}
