import 'package:evoliving/app/core/injection/injection.dart';
import 'package:evoliving/app/core/l10n/arb/app_localizations.dart';
import 'package:evoliving/app/core/routing/router.dart';
import 'package:evoliving/app/core/theming/app_theme.dart';
import 'package:evoliving/app/features/settings/domain/settings_repository.dart';
import 'package:evoliving/app/features/settings/presentation/widgets/settings_bloc.dart';
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
        return BlocProvider(
          create: (_) => SettingsBloc(getIt.get<SettingsRepository>()),
          child: BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, settingsState) {
              return MaterialApp.router(
                title: 'evoliving App',
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                locale: settingsState.settings.language.locale,
                supportedLocales: AppLocalizations.supportedLocales,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                themeMode: settingsState.settings.themeMode,
                debugShowCheckedModeBanner: false,
                routerConfig: appRouter,
              );
            },
          ),
        );
      },
    );
  }
}