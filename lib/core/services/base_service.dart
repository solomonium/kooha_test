import 'package:kooha_test/export.dart';

abstract class BaseService {
  BaseService() {
    _init();
  }

  late final Dio _dio;
  var options = BaseOptions(
    // baseUrl: EnvConfig.baseUrl,
    baseUrl: R.N.baseUrl,
    connectTimeout: const Duration(milliseconds: 20000),
    receiveTimeout: const Duration(milliseconds: 20000),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.acceptHeader: 'application/json',
    },
    contentType: 'application/json',
  );
  HttpClient client = HttpClient();

  _init() {
    _dio = Dio(options);
    _dio.interceptors.add(RetryInterceptor(
        dio: _dio, logPrint: print, retries: 0, retryDelays: [1.seconds]));
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

  final disableRetryOptions = Options()..disableRetry = true;

  Future<Response> get(String path,
      {String? token, bool doRetry = false}) async {
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    Response res =
        await _dio.get(path, options: doRetry ? null : disableRetryOptions);
    return res;
  }

  Future<Response> post(String path, Map<String, dynamic> obj,
      {String? token, bool doRetry = true}) async {
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }

    Response res = await _dio.post(path,
        data: jsonEncode(obj), options: doRetry ? null : disableRetryOptions);
    return res;
  }

  Future<Response> postMultiPartFile(String path, FormData obj,
      {String? token, bool doRetry = false}) async {
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
      _dio.options.headers["content-type"] = 'multipart/form-data';
    }

    // _dioRetry(retry: 0);

    Response res = await _dio.post(path,
        data: obj, options: doRetry ? null : disableRetryOptions);
    return res;
  }

  Future<Response> deleteMultiPartFile(String path, FormData obj,
      {String? token, bool doRetry = false}) async {
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }

    Response res = await _dio.delete(path,
        data: obj, options: doRetry ? null : disableRetryOptions);
    return res;
  }

  Future<Response> delete(String path, Map<String, dynamic> obj,
      {String? token, bool doRetry = true}) async {
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }

    Response res = await _dio.delete(path,
        data: jsonEncode(obj), options: doRetry ? null : disableRetryOptions);
    return res;
  }

  Future<Response> put(String path, Map<String, dynamic> obj,
      {String? token, bool doRetry = true}) async {
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    Response res = await _dio.put(path,
        data: jsonEncode(obj), options: doRetry ? null : disableRetryOptions);
    return res;
  }

  Future<Response> patch(String path, Map<String, dynamic> obj,
      {String? token, bool doRetry = true}) async {
    if (token != null) {
      _dio.options.headers["Authorization"] = "Bearer $token";
    }
    Response res = await _dio.patch(path,
        data: obj, options: doRetry ? null : disableRetryOptions);
    return res;
  }
}
