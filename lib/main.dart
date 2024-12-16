import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pragma/di/dependency_injection.dart';
import 'package:pragma/domain/states/Localization/localization_state.dart';
import 'package:pragma/presentation/routes/route_generator.dart';
import 'package:pragma/presentation/ui/theme/dark_theme.dart';
import 'package:pragma/presentation/ui/theme/light_theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection();
  return runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<LocalizationState>(
          create: (_) => GetIt.instance.get<LocalizationState>()),
    ],
    child: const MyApp(),
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
