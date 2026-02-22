import 'package:go_router/go_router.dart';
import 'package:evoliving/app/features/home/presentation/home_screen.dart';
import 'package:evoliving/app/features/login/presentation/login_screen.dart';
import 'package:evoliving/app/features/settings/presentation/settings_screen.dart'
    show SettingsScreen;
import 'package:evoliving/app/features/signup/presentation/sign_up_screen.dart';
import 'package:evoliving/app/features/splash/presentation/splash_screen.dart';

extension GoRouterStateX on GoRouterState {
  bool get isLoggingIn => matchedLocation == namedLocation(LoginScreen.name);

  bool get isSigningUp => matchedLocation == namedLocation(SignUpScreen.name);

  bool get isLoggingOut =>
      matchedLocation == namedLocation(SettingsScreen.name);

  bool get isGoingToSplash =>
      matchedLocation == namedLocation(SplashScreen.name);

  bool get isGoingToHome => matchedLocation == namedLocation(HomeScreen.name);
}
