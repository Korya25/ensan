// ignore_for_file: deprecated_member_use

import 'package:device_preview/device_preview.dart';
import 'package:ensan_app/core/di/injuction.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ensan_app/core/router/app_router.dart';
import 'package:ensan_app/core/style/theme/app_theme.dart';
import 'package:ensan_app/core/utils/bloc_observer.dart';
import 'package:ensan_app/features/auth/presentation/controller/auth/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjector();
  Bloc.observer = AppBlocObserver();
  runApp(
    // const ensan_app(),
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => EnsanApp(), // Wrap your app
    ),
  );
}

class EnsanApp extends StatelessWidget {
  const EnsanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthCubit>()..checkAuthStatus(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: AppTheme.theme(),
          // device preview
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
        ),
      ),
    );
  }
}
