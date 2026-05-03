import 'package:evoliving/app/core/routing/go_router_refresh_stream.dart';
import 'package:evoliving/app/features/authentication/presentation/bloc/auth_cubit.dart';
import 'package:evoliving/app/features/profile/presentation/more_services.dart';
import 'package:evoliving/app/features/profile/presentation/profile.dart';
import 'package:evoliving/app/features/settings/sub_features/account_and_security/presentation/account_and_security_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/device_update/presentation/device_update.dart';
import 'package:evoliving/app/features/settings/sub_features/personal_information/presentation/personal_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:evoliving/app/core/routing/app_scafold.dart';
import 'package:evoliving/app/features/automation/presentation/automation.dart';
import 'package:evoliving/app/features/control/presentation/control.dart';
import 'package:evoliving/app/features/home/presentation/home_screen.dart';
import 'package:evoliving/app/features/login/presentation/login_screen.dart';
import 'package:evoliving/app/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:evoliving/app/features/onboarding/presentation/onboarding_screen.dart';
import 'package:evoliving/app/features/settings/presentation/settings_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/about/presentation/about_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/dark_theme/presentation/dark_theme_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/language_selection/presentaion/language_selection_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/more_features/presentation/more_features_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/priivacy_settings/privacy_settings_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/privacy_policy/presentaion/privacy_policy_screen.dart';
import 'package:evoliving/app/features/signup/presentation/sign_up_screen.dart';
import 'package:evoliving/app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:evoliving/app/features/splash/presentation/splash_screen.dart';

/// ===============================
/// SINGLE SOURCE OF TRUTH
/// ===============================
final AuthCubit _authCubit = AuthCubit();

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/${SplashScreen.name}',
  refreshListenable: GoRouterRefreshStream(_authCubit.stream),
  redirect: (context, state) {
    final isAuthenticated = _authCubit.state is SuccessState;

    final isAuthRoute = state.matchedLocation == '/${SplashScreen.name}' ||
        state.matchedLocation == '/${OnboardingScreen.name}' ||
        state.matchedLocation == '/${LoginScreen.name}' ||
        state.matchedLocation == '/${SignUpScreen.name}';

    /// ❌ مش logged in → روح login
    if (!isAuthenticated && !isAuthRoute) {
      return '/${LoginScreen.name}';
    }

    /// ❌ logged in داخل auth screens → روح home
    if (isAuthenticated && isAuthRoute) {
      return '/${HomeScreen.name}';
    }

    return null;
  },
  routes: [
    /// ================= SPLASH =================
    GoRoute(
      name: SplashScreen.name,
      path: '/${SplashScreen.name}',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(
          create: (_) => SplashBloc(),
          child: const SplashScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),

    /// ================= ONBOARDING =================
    GoRoute(
      name: OnboardingScreen.name,
      path: '/${OnboardingScreen.name}',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(
          create: (_) => OnboardingCubit(),
          child: const OnboardingScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),

    /// ================= LOGIN =================
    GoRoute(
      name: LoginScreen.name,
      path: '/${LoginScreen.name}',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider.value(
          value: _authCubit,
          child: const LoginScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),

    /// ================= SIGNUP =================
    GoRoute(
      name: SignUpScreen.name,
      path: '/${SignUpScreen.name}',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider.value(
          value: _authCubit,
          child: const SignUpScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),

    /// ================= HOME SHELL =================
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppScaffold(navigationShell: navigationShell);
      },
      branches: [
        /// HOME
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              name: HomeScreen.name,
              path: '/${HomeScreen.name}',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: HomeScreen()),
            ),
          ],
        ),

        /// CONTROL
        StatefulShellBranch(
          navigatorKey: _shellNavigatorControlKey,
          routes: [
            GoRoute(
              name: ControlScreen.name,
              path: '/${ControlScreen.name}',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ControlScreen()),
            ),
          ],
        ),

        /// AUTOMATION
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAutomationKey,
          routes: [
            GoRoute(
              name: AutomationScreen.name,
              path: '/${AutomationScreen.name}',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: AutomationScreen()),
            ),
          ],
        ),

        /// PROFILE
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            GoRoute(
              name: ProfileScreen.name,
              path: '/${ProfileScreen.name}',
              pageBuilder: (context, state) =>
                  const NoTransitionPage(child: ProfileScreen()),
              routes: [
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: SettingsScreen.name,
                  path: SettingsScreen.name,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: const SettingsScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                ),
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: MoreServices.name,
                  path: MoreServices.name,
                  builder: (context, state) => const MoreServices(),
                ),
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: PersonalInformationScreen.name,
                  path: PersonalInformationScreen.name,
                  builder: (context, state) =>
                      const PersonalInformationScreen(),
                ),
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: AccountAndSecurityScreen.name,
                  path: AccountAndSecurityScreen.name,
                  builder: (context, state) => const AccountAndSecurityScreen(),
                ),
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: DeviceUpdate.name,
                  path: DeviceUpdate.name,
                  builder: (context, state) => const DeviceUpdate(),
                ),
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: AboutScreen.name,
                  path: AboutScreen.name,
                  builder: (context, state) => const AboutScreen(),
                ),
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: DarkModeScreen.name,
                  path: DarkModeScreen.name,
                  builder: (context, state) => const DarkModeScreen(),
                ),
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: LanguageSelectionScreen.name,
                  path: LanguageSelectionScreen.name,
                  builder: (context, state) => const LanguageSelectionScreen(),
                ),
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: MoreFeaturesScreen.name,
                  path: MoreFeaturesScreen.name,
                  builder: (context, state) => const MoreFeaturesScreen(),
                ),
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: PrivacySettingsScreen.name,
                  path: PrivacySettingsScreen.name,
                  builder: (context, state) => const PrivacySettingsScreen(),
                ),
                GoRoute(
                  parentNavigatorKey: _rootNavigatorKey,
                  name: PrivacyPolicyScreen.name,
                  path: PrivacyPolicyScreen.name,
                  builder: (context, state) => const PrivacyPolicyScreen(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) => ErrorScreen(error: state.error.toString()),
);

/// ================= NAV KEYS =================
final _rootNavigatorKey = GlobalKey<NavigatorState>();

final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: HomeScreen.name);

final _shellNavigatorProfileKey =
    GlobalKey<NavigatorState>(debugLabel: ProfileScreen.name);

final _shellNavigatorAutomationKey =
    GlobalKey<NavigatorState>(debugLabel: AutomationScreen.name);

final _shellNavigatorControlKey =
    GlobalKey<NavigatorState>(debugLabel: ControlScreen.name);

/// ================= ERROR SCREEN =================
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({required this.error, super.key});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(error)),
    );
  }
}
