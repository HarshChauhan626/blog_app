import 'package:blog_app/presentation/features/explore/explore_screen.dart';
import 'package:blog_app/presentation/features/forgot_password/forgot_password_screen.dart';
import 'package:blog_app/presentation/features/home/home_screen.dart';
import 'package:blog_app/presentation/features/onboarding/onboarding.dart';
import 'package:blog_app/presentation/features/sign_in/sign_in_screen.dart';
import 'package:blog_app/presentation/features/sign_up/sign_up_screen.dart';
import 'package:blog_app/presentation/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class CustomRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('Route: ${settings.name}');
    switch (settings.name) {
      case '/default':
        return MaterialPageRoute(
          settings: const RouteSettings(name: '/default'),
          builder: (_) => const Scaffold(),
        );
      case SplashScreen.routeName:
        return SplashScreen.route();
      case OnboardingScreen.routeName:
        return OnboardingScreen.route();
      case SignInScreen.routeName:
        return SignInScreen.route();
      case SignupScreen.routeName:
        return SignupScreen.route();
      case ForgotPasswordScreen.routeName:
        return ForgotPasswordScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case ExploreScreen.routeName:
        return ExploreScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: '/error'),
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('Something went wrong!'),
        ),
      ),
    );
  }
}
