import 'package:kooha_test/export.dart';

class AuthProvider extends BaseProvider {
  String _token = '';
  String get token => _token;
  set userToken(String token) {
    _token = token;
    notifyListeners();
  }
}
