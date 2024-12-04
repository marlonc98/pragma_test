import 'package:pragma/presentation/ui/pages/ViewModel.dart';
import 'package:pragma/presentation/ui/pages/home/HomePage.dart';

class HomePageViewModel extends ViewModel<HomePage> {
  HomePageViewModel({required super.context, required super.widget});

  String searching = "";

  void onSearch(String value) {
    searching = value;
    notifyListeners();
  }
}
