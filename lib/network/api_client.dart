import 'package:dio/dio.dart';
import 'package:stackoverflow_client/error/base_error.dart';
import 'package:stackoverflow_client/network/network_constants.dart';

class ApiClient {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: NetworkConstants.baseUrl,
    connectTimeout: NetworkConstants.defaultTimeoutMs,
    receiveTimeout: NetworkConstants.defaultTimeoutMs,
  ))..interceptors.add(NetworkErrorInterceptor());

  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic> queryParameters,
    Options options,
    CancelToken cancelToken,
    ProgressCallback onReceiveProgress,
  }) async =>
      _dio.get(
        path,
        options: options,
        queryParameters: queryParameters,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
}

class NetworkErrorInterceptor extends Interceptor {
  @override
  Future onError(DioError err) async {
    _parseDioError(err);
  }

  void _parseDioError(DioError dioError) {
    throw BaseException(getErrorText(dioError), code: getErrorCode(dioError));
  }

  static dynamic getErrorCode(DioError err) => err.response.statusCode;


  String getErrorText(DioError err) => '${err.response.data['error_name']}: ${err.response.data['error_message']}';
}
