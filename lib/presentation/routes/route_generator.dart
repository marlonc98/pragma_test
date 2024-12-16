import 'package:flutter/material.dart';
import 'package:pragma/presentation/ui/pages/cat/list/cat_list_page.dart';
import 'package:pragma/presentation/ui/pages/splah/splash_page.dart';
import 'package:pragma/presentation/ui/pages/cat/detailed/detailed_cat_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case SplashPage.route:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case CatListPage.route:
        return MaterialPageRoute(builder: (_) => const CatListPage());
      case DetailedCatPage.route:
        return MaterialPageRoute(builder: (_) => args as DetailedCatPage);
      default:
        return MaterialPageRoute(builder: (_) => const SplashPage());
    }
  }
}
