import 'package:flutter/material.dart';
import 'package:pragma/presentation/ui/pages/cat/list/CatListPage.dart';
import 'package:pragma/presentation/ui/pages/splah/SplashPage.dart';
import 'package:pragma/presentation/ui/pages/cat/detailed/DetailedCatPage.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case SplashPage.route:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case CatListPage.route:
        return MaterialPageRoute(builder: (_) => CatListPage());
      case DetialedCatPage.route:
        return MaterialPageRoute(builder: (_) => args as DetialedCatPage);
      default:
        return MaterialPageRoute(builder: (_) => SplashPage());
    }
  }
}
