import 'package:flutter/material.dart';
import 'package:pragma/presentation/routes/RouteGenerator.dart';
import 'package:pragma/presentation/ui/theme/DarkTheme.dart';
import 'package:pragma/presentation/ui/theme/LightTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
