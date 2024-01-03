import 'package:flutter/material.dart';
import 'package:kobciye/pages/countries_screen.dart';
import 'package:kobciye/pages/signin_screen.dart';
import 'package:kobciye/pages/splash_screen.dart';


class RouteNames {
  static const String splashScreen = '/';
  static const String countriesScreen = '/countries';
  static const String signinScreen = '/signinScreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SplashScreen());
      case RouteNames.countriesScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const CountriesScreen());
      case RouteNames.signinScreen:
        return MaterialPageRoute(
            settings: settings, builder: (_) => const SigninScreen());
      // case RouteNames.homeScreen:
      //   return MaterialPageRoute(
      //       settings: settings, builder: (_) => const HomeScreen());
      // case RouteNames.resultScreen:
      //   final body = settings.arguments as Map<String, dynamic>;
      //   return MaterialPageRoute(
      //       settings: settings, builder: (_) => ResultScreen(body: body));

  

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
