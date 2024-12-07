import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pragma/domain/use_cases/default/LoadUseCase.dart';
import 'package:pragma/presentation/ui/pages/cat/list/CatListPage.dart';
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
                  color: Colors.white),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5 - 240,
            ),
            Lottie.asset('assets/splash/splash.json', height: 200),
            SizedBox(
              height: 4,
            ),
            Text(
              'Version 1.0.0',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
      function: GetIt.instance.get<LoadUseCase>().call,
      // duration: 1500,
      nextScreen: CatListPage(),
    );
  }
}
