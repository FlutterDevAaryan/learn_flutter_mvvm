
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter_mvvm/utils/routes/routes_name.dart';
import 'package:learn_flutter_mvvm/view/home_screen.dart';
import 'package:learn_flutter_mvvm/view/login_screen.dart';
import 'package:learn_flutter_mvvm/view/login_view.dart';
import 'package:learn_flutter_mvvm/view/sign_up_view.dart';
import 'package:learn_flutter_mvvm/view/splash_view.dart';

class Routes{
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {

      case RoutesName.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case RoutesName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case RoutesName.loginView:
        return MaterialPageRoute(builder: (context) => const LoginView());

      case RoutesName.signUpView:
        return MaterialPageRoute(builder: (context) => const SignUpView());

      case RoutesName.splashView:
        return MaterialPageRoute(builder: (context) => const SplashView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });
    }
  }
}