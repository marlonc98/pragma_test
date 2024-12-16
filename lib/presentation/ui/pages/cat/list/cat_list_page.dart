import 'package:flutter/material.dart';
import 'package:pragma/domain/entities/cat_entity.dart';
import 'package:pragma/presentation/ui/pages/cat/detailed/detailed_cat_page.dart';
import 'package:pragma/presentation/ui/pages/cat/list/cat_list_page_view_model.dart';
import 'package:pragma/presentation/ui/pages/cat/list/widgets/cat_card_widget.dart';
import 'package:pragma/presentation/ui/widgets/searcher_app_bar.dart';
import 'package:pragma/utils/key_words_constants.dart';
import 'package:provider/provider.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class CatListPage extends StatelessWidget {
  static const String route = '/cat';
  const CatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CatListPageViewModel>(
        create: (_) => CatListPageViewModel(context: context, widget: this),
        child: Consumer<CatListPageViewModel>(
            builder: (context, viewModel, child) => Scaffold(
                    body: CustomScrollView(
                  slivers: [
                    SearcherAppBar(
                      title: viewModel.localization.translate(KeyWordsConstants.catListPageTitle),
                      onSearch: viewModel.handleOnChangeQuery,
                      waitSearch: true,
                    ),
                    SliverFillRemaining(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PagedListView<int, CatEntity>(
                          padding: const EdgeInsets.all(0),
                          pagingController: viewModel.pagingController,
                          builderDelegate: PagedChildBuilderDelegate<CatEntity>(
                            itemBuilder: (context, item, index) => Container(
                              margin: const EdgeInsets.only(bottom: 8),
                              child: CatCardWidget(
                                cat: item,
                                onTap: () => Navigator.of(context).pushNamed(
                                    DetailedCatPage.route,
                                    arguments: DetailedCatPage(id: item.id)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))));
  }
}
