import 'package:flutter/material.dart';
import 'package:pragma/presentation/ui/pages/home/HomePageViewModel.dart';
import 'package:pragma/presentation/ui/pages/home/widgets/CatCardWidget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  static const String route = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageViewModel>(
        create: (_) => HomePageViewModel(context: context, widget: this),
        child: Consumer<HomePageViewModel>(
            builder: (context, viewModel, child) => Scaffold(
                  body: ListView(
                    children: viewModel.cats
                        .map((e) => CatCardWidget(cat: e))
                        .toList(),
                  ),
                )));
  }
}
