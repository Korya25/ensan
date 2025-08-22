import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ensan_app/features/data/repositories/auth_repository.dart';
import 'package:ensan_app/features/presentation/controller/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final AuthRepository _authRepository;

  RegisterCubit(this._authRepository) : super(RegisterInitial());

  Future<void> signUp(String email, String password, String displayName) async {
    emit(RegisterLoading());
    try {
      final user = await _authRepository.signUp(email, password, displayName);
      emit(RegisterSuccess(user));
    } catch (e) {
      emit(RegisterError(e.toString()));
    }
  }

  void reset() => emit(RegisterInitial());
}
