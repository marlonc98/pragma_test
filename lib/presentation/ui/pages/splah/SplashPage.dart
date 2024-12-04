import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:pragma/presentation/ui/pages/home/HomePage.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  static const String route = '/splash';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Theme.of(context).colorScheme.primary,
      splash: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'CatSearch',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyMedium?.color),
            ),
            Lottie.asset(
              'assets/splash/splash.json',
            ),
          ],
        ),
      ),
      duration: 3000000,
      nextScreen: HomePage(),
    );
  }
}
