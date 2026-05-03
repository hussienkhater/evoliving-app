import 'package:go_router/go_router.dart';
import 'package:evoliving/app/features/home/presentation/home_screen.dart';
import 'package:evoliving/app/features/login/presentation/login_screen.dart';
import 'package:evoliving/app/features/signup/presentation/sign_up_screen.dart';
import 'package:evoliving/app/features/splash/presentation/splash_screen.dart';

extension GoRouterStateX on GoRouterState {
  bool get isLogin => matchedLocation == '/${LoginScreen.name}';

  bool get isSignup => matchedLocation == '/${SignUpScreen.name}';

  bool get isSplash => matchedLocation == '/${SplashScreen.name}';

  bool get isHome => matchedLocation == '/${HomeScreen.name}';
}