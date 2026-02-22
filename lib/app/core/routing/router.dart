import 'package:evoliving/app/features/settings/sub_features/personal_information/presentation/personal_information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:evoliving/app/core/extension_methods/getit_x.dart';
import 'package:evoliving/app/core/injection/injection.dart';
import 'package:evoliving/app/core/routing/app_scafold.dart';
import 'package:evoliving/app/core/routing/go_router_refresh_stream.dart';
import 'package:evoliving/app/features/automation/presentation/automation.dart';
import 'package:evoliving/app/features/control/presentation/control.dart';
import 'package:evoliving/app/features/home/presentation/home_screen.dart';
import 'package:evoliving/app/features/login/cubit/login_cubit.dart';
import 'package:evoliving/app/features/login/presentation/login_screen.dart';
import 'package:evoliving/app/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:evoliving/app/features/onboarding/presentation/onboarding_screen.dart';
import 'package:evoliving/app/features/settings/presentation/settings_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/about/presentation/about_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/dark_theme/presentation/dark_theme_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/language_selection/presentaion/language_selection_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/more_features/presentation/home_device_overview_Screen.dart';
import 'package:evoliving/app/features/settings/sub_features/more_features/presentation/more_features_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/priivacy_settings/privacy_settings_screen.dart';
import 'package:evoliving/app/features/settings/sub_features/privacy_policy/presentaion/privacy_policy_screen.dart';
import 'package:evoliving/app/features/signup/cubit/sign_up_cubit.dart';
import 'package:evoliving/app/features/signup/presentation/sign_up_screen.dart';
import 'package:evoliving/app/features/splash/presentation/bloc/splash_bloc.dart';
import 'package:evoliving/app/features/splash/presentation/splash_screen.dart';

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/${SplashScreen.name}',
  routes: [
    // Auth routes
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
    GoRoute(
      name: OnboardingScreen.name,
      path: '/${OnboardingScreen.name}',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(
          create: (context) => OnboardingCubit(),
          child: const OnboardingScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      name: LoginScreen.name,
      path: '/${LoginScreen.name}',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(
          create: (_) => getIt.get<LoginCubit>(),
          child: const LoginScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),
    GoRoute(
      name: SignUpScreen.name,
      path: '/${SignUpScreen.name}',
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: BlocProvider(
          create: (_) => getIt.get<SignUpCubit>(),
          child: const SignUpScreen(),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(opacity: animation, child: child),
      ),
    ),

    // Main app shell route for bottom navigation
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppScaffold(navigationShell: navigationShell);
      },
      branches: [
        // Home branch
        StatefulShellBranch(
          navigatorKey: _shellNavigatorHomeKey,
          routes: [
            GoRoute(
              name: HomeScreen.name,
              path: '/${HomeScreen.name}',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: HomeScreen(),
              ),
              routes: [
                // Child routes of Home
                GoRoute(
                  name: HomeDeviceOverviewScreen.name,
                  path: HomeDeviceOverviewScreen.name,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: const HomeDeviceOverviewScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(navigatorKey: _shellNavigatorControlKey, routes: [
          GoRoute(
            name: ControlScreen.name,
            path: '/${ControlScreen.name}',
            pageBuilder: (context, state) => const NoTransitionPage(
              child: ControlScreen(),
            ),
          ),
        ]),

        StatefulShellBranch(
            navigatorKey: _shellNavigatorAutomationKey,
            routes: [
              GoRoute(
                name: AutomationScreen.name,
                path: '/${AutomationScreen.name}',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: AutomationScreen(),
                ),
              ),
            ]),

        // Settings branch
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettingsKey,
          routes: [
            GoRoute(
              name: SettingsScreen.name,
              path: '/${SettingsScreen.name}',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsScreen(),
              ),
              routes: [
                // Child routes of Settings
                GoRoute(
                  name: PersonalInformationScreen.name,
                  path: PersonalInformationScreen.name,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: const PersonalInformationScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                ),
                GoRoute(
                  name: AboutScreen.name,
                  path: AboutScreen.name,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: const AboutScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                ),
                GoRoute(
                  name: DarkModeScreen.name,
                  path: DarkModeScreen.name,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: const DarkModeScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                ),
                GoRoute(
                  name: LanguageSelectionScreen.name,
                  path: LanguageSelectionScreen.name,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: const LanguageSelectionScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                ),
                GoRoute(
                  name: MoreFeaturesScreen.name,
                  path: MoreFeaturesScreen.name,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: const MoreFeaturesScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                ),
                GoRoute(
                  name: PrivacySettingsScreen.name,
                  path: PrivacySettingsScreen.name,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: const PrivacySettingsScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                ),
                GoRoute(
                  name: PrivacyPolicyScreen.name,
                  path: PrivacyPolicyScreen.name,
                  pageBuilder: (context, state) => CustomTransitionPage(
                    key: state.pageKey,
                    child: const PrivacyPolicyScreen(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
  refreshListenable: GoRouterRefreshStream(
    getIt.authBloc.stream.where((state) => state.isSuccess),
  ),
  // redirect: (context, state) {
  //   // If the user is not logged in, they need to login
  //   final isAuthenticated =
  //       getIt.authBloc.state.data?.isAuthenticated ?? false;
  //   final isAuthRoute = state.matchedLocation == '/${SplashScreen.name}' ||
  //       state.matchedLocation == '/${OnboardingScreen.name}' ||
  //       state.matchedLocation == '/${LoginScreen.name}' ||
  //       state.matchedLocation == '/${SignUpScreen.name}';
  //
  //   // If the user is not authenticated and tries to access a protected route
  //   if (!isAuthenticated && !isAuthRoute) {
  //     // Store the location they were trying to access
  //     final fromLocation = state.matchedLocation;
  //     return state.namedLocation(
  //       LoginScreen.name,
  //       queryParameters: {if (fromLocation.isNotEmpty) 'from': fromLocation},
  //     );
  //   }
  //
  //   // If the user is authenticated and trying to access auth routes
  //   if (isAuthenticated && isAuthRoute) {
  //     // Redirect to home screen
  //     return state.namedLocation(HomeScreen.name);
  //   }
  //
  //   // If the user is logging in and has a previous destination
  //   if (state.matchedLocation == '/${LoginScreen.name}' && isAuthenticated) {
  //     return state.uri.queryParameters['from'] ??
  //         state.namedLocation(HomeScreen.name);
  //   }
  //
  //   // No redirect needed
  //   return null;
  // },
  errorBuilder: (context, state) => ErrorScreen(error: state.error.toString()),
);

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorHomeKey =
    GlobalKey<NavigatorState>(debugLabel: HomeScreen.name);
final _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: SettingsScreen.name);
final _shellNavigatorAutomationKey =
    GlobalKey<NavigatorState>(debugLabel: AutomationScreen.name);
final _shellNavigatorControlKey =
    GlobalKey<NavigatorState>(debugLabel: ControlScreen.name);

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({required this.error, super.key});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(error),
      ),
    );
  }
}
