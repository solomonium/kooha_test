import 'package:kooha_test/export.dart';

class AuthServices extends BaseService {
  Future<Response?> login(Map<String, dynamic> payload) async {
    payload.removeWhere((key, value) => value == null || value == '');
    safePrint(payload);
    Response? res;
    try {
      res = await post('/auth/test/login', payload);
      return res;
    } on DioException catch (e) {
      DioExceptions.fromDioError(e).showNotification();

      res = e.response;

      /// DioExceptions.fromDioError(res);
      /// planed to  use the above for dio exception handling

      return res;
    } catch (e) {
      safePrint(e);
      return null;
    }
  }
}
