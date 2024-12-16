import 'package:flutter/material.dart';
import 'package:pragma/presentation/ui/pages/cat/detailed/detailed_cat_page_view_model.dart';
import 'package:pragma/presentation/ui/pages/cat/detailed/widgets/cat_feature_item_widget.dart';
import 'package:pragma/presentation/ui/widgets/list_item_widget.dart';
import 'package:pragma/presentation/ui/widgets/loading_widget.dart';
import 'package:pragma/presentation/ui/widgets/not_found_widget.dart';
import 'package:pragma/presentation/ui/widgets/not_read_image_widget.dart';
import 'package:pragma/utils/key_words_constants.dart';
import 'package:provider/provider.dart';

class DetailedCatPage extends StatelessWidget {
  static const String route = '/cat/detailed';
  final String id;
  const DetailedCatPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailedCatPageViewModel>(
      create: (_) => DetailedCatPageViewModel(context: context, widget: this),
      child: Consumer<DetailedCatPageViewModel>(
          builder: (context, viewModel, child) {
        if (viewModel.loading && viewModel.cat == null) {
          return const Scaffold(
            body: LoadingWidget(),
          );
        } else if (viewModel.cat == null) {
          return const NotFoundWidget();
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text(viewModel.cat!.name),
            ),
            body: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Image.network(
                    viewModel.cat!.image,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const NotReadImageWidget();
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const NotReadImageWidget();
                    },
                  ),
                ),
                Expanded(
                    child: Container(
                  transform: Matrix4.translationValues(0, -20, 0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      gradient: LinearGradient(
                        colors: [
                          Theme.of(context)
                              .colorScheme
                              .primary
                              .withValues(alpha: 0.5),
                          Theme.of(context)
                              .colorScheme
                              .primary
                              .withValues(alpha: 0.1),
                        ],
                        begin: Alignment.topCenter,
                        end: const Alignment(0, 0.01),
                      ),
                    ),
                    child: ListView(
                      children: [
                        if (viewModel.cat!.description != null)
                          ListItemWidget(
                            title: viewModel.localization.translate(
                                KeyWordsConstants.detailedCatPageDescription),
                            value: viewModel.cat!.description ?? "",
                          ),
                        if (viewModel.cat!.origin != null)
                          ListItemWidget(
                            title: viewModel.localization.translate(
                                KeyWordsConstants.detailedCatPageOrigin),
                            value: viewModel.cat!.origin ?? "",
                          ),
                        if (viewModel.cat!.temperament != null)
                          ListItemWidget(
                              title: viewModel.localization.translate(
                                  KeyWordsConstants.detailedCatPageTemperament),
                              value: viewModel.cat!.temperament),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          alignment: WrapAlignment.spaceBetween,
                          runSpacing: 8,
                          children: [
                            if (viewModel.cat?.adaptability != null)
                              CatFeatureItemWidget(
                                title: viewModel.localization.translate(
                                    KeyWordsConstants
                                        .detailedCatPageAdaptability),
                                value: viewModel.cat!.adaptability.toString(),
                                icon: Icons.catching_pokemon,
                              ),
                            if (viewModel.cat?.intelligence != null)
                              CatFeatureItemWidget(
                                title: viewModel.localization.translate(
                                    KeyWordsConstants
                                        .detailedCatPageItelligence),
                                value: viewModel.cat!.intelligence.toString(),
                                icon: Icons.catching_pokemon,
                              ),
                            if (viewModel.cat?.affectionLevel != null)
                              CatFeatureItemWidget(
                                title: viewModel.localization.translate(
                                    KeyWordsConstants
                                        .detailedCatPageAffectionLevel),
                                value: viewModel.cat!.affectionLevel.toString(),
                                icon: Icons.catching_pokemon,
                              ),
                            if (viewModel.cat?.childFriendly != null)
                              CatFeatureItemWidget(
                                title: viewModel.localization.translate(
                                    KeyWordsConstants
                                        .detailedCatPageChildFriendly),
                                value: viewModel.cat!.childFriendly.toString(),
                                icon: Icons.catching_pokemon,
                              ),
                            if (viewModel.cat?.lifeSpan != null)
                              CatFeatureItemWidget(
                                title: viewModel.localization.translate(
                                    KeyWordsConstants.detailedCatPageLifeSpan),
                                value: viewModel.cat!.lifeSpan!,
                                icon: Icons.catching_pokemon,
                              ),
                            if (viewModel.cat?.weight != null)
                              CatFeatureItemWidget(
                                title: viewModel.localization.translate(
                                    KeyWordsConstants.detailedCatPageWeight),
                                value: viewModel.cat!.weight!,
                                icon: Icons.catching_pokemon,
                              ),
                            if (viewModel.cat?.countryCode != null)
                              CatFeatureItemWidget(
                                title: viewModel.localization.translate(
                                    KeyWordsConstants
                                        .detailedCatPageCountryCode),
                                value: viewModel.cat!.countryCode!,
                                icon: Icons.catching_pokemon,
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ))
              ],
            ),
          );
        }
      }),
    );
  }
}
