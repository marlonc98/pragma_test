import 'package:flutter/material.dart';
import 'package:pragma/presentation/ui/pages/cat/detailed/DetailedCatPageViewModel.dart';
import 'package:provider/provider.dart';

class DetialedCatPage extends StatelessWidget {
  static const String route = '/cat/detailed';
  final String id;
  const DetialedCatPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetialedCatPageViewModel>(
        create: (_) => DetialedCatPageViewModel(context: context, widget: this),
        child: Consumer<DetialedCatPageViewModel>(
            builder: (context, viewModel, child) => Scaffold(
                    body: Container(
                        child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                    ),
                    Expanded(
                        child: Container(
                      child: ListView(
                        children: [
                          Text('daat'),
                        ],
                      ),
                    ))
                  ],
                )))));
  }
}
