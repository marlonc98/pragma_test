import 'package:flutter/material.dart';
import 'package:pragma/presentation/ui/pages/cat/detailed/DetailedCatPageViewModel.dart';
import 'package:pragma/presentation/ui/pages/cat/detailed/widgets/CatFeatureItemWidget.dart';
import 'package:pragma/presentation/ui/widgets/loading/LoadingWidget.dart';
import 'package:pragma/presentation/ui/widgets/notFound/NotFoundWidget.dart';
import 'package:pragma/presentation/ui/widgets/notReadImage.dart/NotReadImageWidget.dart';
import 'package:provider/provider.dart';
import 'package:pragma/presentation/ui/widgets/listItem/ListItem.dart';

class DetialedCatPage extends StatelessWidget {
  static const String route = '/cat/detailed';
  final String id;
  const DetialedCatPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetialedCatPageViewModel>(
        create: (_) => DetialedCatPageViewModel(context: context, widget: this),
        child: Consumer<DetialedCatPageViewModel>(
            builder: (context, viewModel, child) {
          if (viewModel.loading && viewModel.cat == null) {
            return Scaffold(
              body: LoadingWidget(),
            );
          } else if (viewModel.cat == null) {
            return NotFoundWidget();
          } else
            return Scaffold(
                appBar: AppBar(
                  title: Text(viewModel.cat!.name),
                ),
                body: Container(
                    child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: Image.network(
                        viewModel.cat!.image,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return NotReadImageWidget();
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return NotReadImageWidget();
                        },
                      ),
                    ),
                    Expanded(
                        child: Container(
                      transform: Matrix4.translationValues(0, -20, 0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          gradient: LinearGradient(
                            colors: [
                              Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.5),
                              Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.1),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment(0, 0.01),
                          ),
                        ),
                        child: ListView(
                          children: [
                            viewModel.cat!.description != null
                                ? ListItem(
                                    title: 'Description',
                                    value: viewModel.cat!.description ?? "s",
                                  )
                                : Container(),
                            viewModel.cat!.origin != null
                                ? ListItem(
                                    title: 'Origin',
                                    value: viewModel.cat!.origin ?? "s",
                                  )
                                : Container(),
                            viewModel.cat!.temperament != null
                                ? ListItem(
                                    title: "Temperament",
                                    value: viewModel.cat!.temperament)
                                : Container(),
                            SizedBox(height: 8),
                            Container(
                              child: Wrap(
                                spacing: 8,
                                alignment: WrapAlignment.spaceBetween,
                                runSpacing: 8,
                                children: [
                                  viewModel.cat?.adaptability != null
                                      ? CatFeatureItemWidget(
                                          title: "Adaptability",
                                          value: viewModel.cat!.adaptability
                                              .toString(),
                                          icon: Icons.catching_pokemon,
                                        )
                                      : Container(),
                                  viewModel.cat?.intelligence != null
                                      ? CatFeatureItemWidget(
                                          title: "Intelligence",
                                          value: viewModel.cat!.intelligence
                                              .toString(),
                                          icon: Icons.catching_pokemon,
                                        )
                                      : Container(),
                                  viewModel.cat?.affectionLevel != null
                                      ? CatFeatureItemWidget(
                                          title: "Affection Level",
                                          value: viewModel.cat!.affectionLevel
                                              .toString(),
                                          icon: Icons.catching_pokemon,
                                        )
                                      : Container(),
                                  viewModel.cat?.childFriendly != null
                                      ? CatFeatureItemWidget(
                                          title: "Child Friendly",
                                          value: viewModel.cat!.childFriendly
                                              .toString(),
                                          icon: Icons.catching_pokemon,
                                        )
                                      : Container(),
                                  viewModel.cat?.lifeSpan != null
                                      ? CatFeatureItemWidget(
                                          title: "Life Span",
                                          value: viewModel.cat!.lifeSpan!,
                                          icon: Icons.catching_pokemon,
                                        )
                                      : Container(),
                                  viewModel.cat?.weight != null
                                      ? CatFeatureItemWidget(
                                          title: "Weight",
                                          value: viewModel.cat!.weight!,
                                          icon: Icons.catching_pokemon,
                                        )
                                      : Container(),
                                  viewModel.cat?.countryCode != null
                                      ? CatFeatureItemWidget(
                                          title: "Country Code",
                                          value: viewModel.cat!.countryCode!,
                                          icon: Icons.catching_pokemon,
                                        )
                                      : Container(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                )));
        }));
  }
}
