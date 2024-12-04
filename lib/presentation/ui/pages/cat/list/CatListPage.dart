import 'package:flutter/material.dart';
import 'package:pragma/domain/entities/CatEntity.dart';
import 'package:pragma/presentation/ui/pages/cat/detailed/DetailedCatPage.dart';
import 'package:pragma/presentation/ui/pages/cat/list/CatListPageViewModel.dart';
import 'package:pragma/presentation/ui/pages/cat/list/widgets/CatCardWidget.dart';
import 'package:pragma/presentation/ui/widgets/searcherAppBar/SearcherAppBar.dart';
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
                    body: Container(
                  child: CustomScrollView(
                    slivers: [
                      SearcherAppBar(
                        title: "Cats",
                        onSearch: viewModel.handleOnChangeQuery,
                        waitSearch: true,
                      ),
                      SliverFillRemaining(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PagedListView<int, CatEntity>(
                            padding: EdgeInsets.zero,
                            pagingController: viewModel.pagingController,
                            builderDelegate:
                                PagedChildBuilderDelegate<CatEntity>(
                              itemBuilder: (context, item, index) => Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: CatCardWidget(
                                  cat: item,
                                  onTap: () => Navigator.of(context).pushNamed(
                                      DetialedCatPage.route,
                                      arguments: DetialedCatPage(id: item.id)),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))));
  }
}
