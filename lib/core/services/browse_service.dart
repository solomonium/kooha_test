import 'package:kooha_test/export.dart';

class BrowseServices extends BaseService {
  Future<Response?> getFeaturedCeleb({required String token}) async {
    Response? res;
    try {
      res = await get('/users/test/featured', token: token);
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

  Future<Response?> getTrendingCeleb({required String token}) async {
    Response? res;
    try {
      res = await get('/users/test/trending', token: token);
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

  Future<Response?> getCelebById(String id, {required String token}) async {
    Response? res;
    try {
      res = await get('/users/$id', token: token);
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
