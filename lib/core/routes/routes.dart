import 'package:bookia/features/auth/login/pages/login_screen.dart';
import 'package:bookia/features/auth/register/pages/register_screen.dart';
import 'package:bookia/features/main/main_app_screen.dart';
import 'package:bookia/features/splash/splash_screen.dart';
import 'package:bookia/features/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String splah = "/";
  static String welcome = "/welcome";
  static String login = "/login";
  static String register = "/register";
  static String main = "/main";

  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: splah, builder: (context, state) => SplashScreen()),
      GoRoute(path: welcome, builder: (context, state) => WelcomeScreen()),
      GoRoute(path: login, builder: (context, state) => LoginScreen()),
      GoRoute(path: register, builder: (context, state) => RegisterScreen()),
      GoRoute(path: main, builder: (context, state) => MainAppScreen()),
    ],
  );
}
