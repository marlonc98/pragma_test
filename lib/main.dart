import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pragma/di/DependencyInjection.dart';
import 'package:pragma/domain/providers/Localization/LocallizationProvider.dart';
import 'package:pragma/presentation/routes/RouteGenerator.dart';
import 'package:pragma/presentation/ui/theme/DarkTheme.dart';
import 'package:pragma/presentation/ui/theme/LightTheme.dart';
import 'package:provider/provider.dart';

void main() {
  DependencyInjection();

  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LocalizationProvider>(
          create: (_) => GetIt.instance.get<LocalizationProvider>()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catbreeds',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
