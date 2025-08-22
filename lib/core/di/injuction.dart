import 'package:get_it/get_it.dart';
import 'package:ensan_app/core/services/shared_pref/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ensan_app/features/auth/data/datasources/auth_datasource.dart';
import 'package:ensan_app/features/auth/data/datasources/local_datasource.dart';
import 'package:ensan_app/features/auth/data/repositories/auth_repository.dart';
import 'package:ensan_app/features/auth/presentation/controller/auth/auth_cubit.dart';
import 'package:ensan_app/features/auth/presentation/controller/forgot_pass_cubit/forgot_password_cubit.dart';
import 'package:ensan_app/features/auth/presentation/controller/login/login_cubit.dart';
import 'package:ensan_app/features/auth/presentation/controller/register/register_cubit.dart';

import 'package:ensan_app/firebase_options.dart';

final sl = GetIt.instance;

Future<void> setupInjector() async {
  await _initServices();
  _initDataSources();
  _initRepositories();
  _initCubits();
}

Future<void> _initServices() async {
  // SharedPref Service
  sl.registerLazySingleton<SharedPrefService>(() => SharedPrefService());
  await sl<SharedPrefService>().init();

  // Firebase Service
  sl.registerLazySingleton<FirebaseService>(() => FirebaseService());
  await sl<FirebaseService>().init();

  // Firebase Auth
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}

void _initDataSources() {
  // Remote (Firebase)
  sl.registerLazySingleton<AuthDataSource>(
    () => FirebaseAuthDataSource(firebaseAuth: sl()),
  );

  // Local (SharedPrefs)
  sl.registerLazySingleton<LocalDataSource>(() => SharedPrefsDataSource());
}

void _initRepositories() {
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepository(sl<AuthDataSource>(), sl<LocalDataSource>()),
  );
}

void _initCubits() {
  sl.registerLazySingleton<AuthCubit>(() => AuthCubit(sl()));

  sl.registerFactory<LoginCubit>(() => LoginCubit(sl()));
  sl.registerFactory<RegisterCubit>(() => RegisterCubit(sl()));
  sl.registerFactory<ForgotPasswordCubit>(() => ForgotPasswordCubit(sl()));
}

/// Shared Preferences Service
class SharedPrefService {
  Future<void> init() async {
    await SharedPref.initialize();
  }
}

/// Firebase Service
class FirebaseService {
  Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
