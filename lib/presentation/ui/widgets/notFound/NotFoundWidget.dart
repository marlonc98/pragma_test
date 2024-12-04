import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pragma/presentation/ui/theme/LightTheme.dart';

class NotFoundWidget extends StatelessWidget {
  const NotFoundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Not Resutls'),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Go back')),
            SizedBox(height: MediaQuery.of(context).size.height * 0.4 - 300),
            Lottie.asset('assets/splash/not_found.json', height: 200),
          ],
        ),
      ),
    );
  }
}
