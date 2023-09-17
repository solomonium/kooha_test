import 'package:kooha_test/export.dart';

enum LoadingState {
  idle,
  busy,
  loaded,
  error;
}

class HomeProvider extends BaseProvider {
  LoadingState _loadingState = LoadingState.idle;
  updateLoadingState(LoadingState loadingState) {
    _loadingState = loadingState;
    notifyListeners();
  }

  LoadingState get loadingState => _loadingState;
  int _navIndex = 0;
  int get navIndex => _navIndex;
  set navIndex(int val) {
    _navIndex = val;
    // print(val);
    notifyListeners();
  }

  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int val) {
    _tabIndex = val;
    notifyListeners();
  }
}
