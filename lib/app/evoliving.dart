import 'package:evoliving/app/core/routing/router.dart';
import 'package:evoliving/app/core/theming/app_theme.dart';
import 'package:evoliving/app/features/authentication/presentation/bloc/auth_cubit.dart';
import 'package:evoliving/app/features/home/presentation/bloc/sensor_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EvolivingApp extends StatelessWidget {
  const EvolivingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(440, 956),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (_) => AuthCubit()..checkAuth(),
            ),
            BlocProvider(
              create: (_) => SensorCubit()..getLatestSensorData(),
            ),
          ],
          child: MaterialApp.router(
            title: 'Evoliving App',
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: ThemeMode.system,
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter,
          ),
        );
      },
    );
  }
}