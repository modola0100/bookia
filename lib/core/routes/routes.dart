import 'package:bookia/features/auth/cubit/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/forget_password/pages/forget_password_screen.dart';
import 'package:bookia/features/auth/presentation/login/pages/login_screen.dart';
import 'package:bookia/features/auth/presentation/otp/pages/otp_screen.dart';
import 'package:bookia/features/auth/presentation/register/pages/register_screen.dart';
import 'package:bookia/features/datails/details_screen.dart';
import 'package:bookia/features/home/data/models/best_seller_response/product.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/main/main_app_screen.dart';
import 'package:bookia/features/search/presentation/search_screen.dart';
import 'package:bookia/features/splash/splash_screen.dart';
import 'package:bookia/features/welcome/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static String splah = "/";
  static String welcome = "/welcome";
  static String login = "/login";
  static String register = "/register";
  static String main = "/main";
  static String details = "/details";
  static String forget_password = "/forget_password";
  static String otp = "/otp";
  static String search = "/search";

  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: splah, builder: (context, state) => SplashScreen()),
      GoRoute(path: welcome, builder: (context, state) => WelcomeScreen()),
      GoRoute(
        path: otp,
        builder: (context, state) =>
            BlocProvider(create: (context) => AuthCubit(), child: OtpScreen()),
      ),
      GoRoute(
        path: forget_password,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: ForgetPasswordScreen(),
        ),
      ),
      GoRoute(
        path: login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: LoginScreen(),
        ),
      ),
      GoRoute(
        path: register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: RegisterScreen(),
        ),
      ),
      GoRoute(path: main, builder: (context, state) => MainAppScreen()),
      GoRoute(
        path: details,
        name: "details",
        builder: (context, state) {
          final book = state.extra as Product;
          return BlocProvider(
            create: (context) => HomeCubit(),
            child: DetailsScreen(book: book),
          );
        },
      ),
      GoRoute(
        path: search,
        name: "search",
        builder: (context, state) => SearchScreen(),
      ),
    ],
  );
}
