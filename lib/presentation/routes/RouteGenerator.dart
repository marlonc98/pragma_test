import 'package:flutter/material.dart';
import 'package:pragma/presentation/ui/pages/home/HomePage.dart';
import 'package:pragma/presentation/ui/pages/splah/SplashPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case SplashPage.route:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case HomePage.route:
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}
