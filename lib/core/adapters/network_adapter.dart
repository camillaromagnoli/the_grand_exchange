import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:the_grand_exchange/core/api/api_routes.dart';

abstract class NetworkAdapter {
  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}

@Injectable(as: NetworkAdapter)
class NetworkAdapterImpl implements NetworkAdapter {
  final Dio _dio;

  NetworkAdapterImpl(this._dio);

  @override
  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final Response result = await _dio.get(
        '${ApiRoutes.baseApi}$url',
        queryParameters: queryParameters,
        options: options,
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
