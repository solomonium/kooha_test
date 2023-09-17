import 'package:kooha_test/export.dart';

class AppProvider extends BaseProvider {
  ThemeType _theme = ThemeType.light;
  ThemeType get theme => _theme;
  set theme(ThemeType val) {
    _theme = val;
    notifyListeners();
  }

  int get currentPage => _currentPage;
  int _currentPage = 0;
  set currentPage(int value) {
    _currentPage = value;
    notifyListeners();
  }
}
