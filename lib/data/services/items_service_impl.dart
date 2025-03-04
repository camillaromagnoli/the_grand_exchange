import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:the_grand_exchange/core/adapters/network_adapter.dart';
import 'package:the_grand_exchange/core/api/api_routes.dart';
import 'package:the_grand_exchange/domain/services/items_service.dart';

@Injectable(as: ItemsService)
class ItemsServiceImpl extends ItemsService {
  ItemsServiceImpl({required NetworkAdapter networkAdapter})
    : _networkAdapter = networkAdapter;

  final NetworkAdapter _networkAdapter;

  @override
  Future<Response> getItems({
    required int category,
    required String alpha,
    required int page,
  }) async {
    final Response response = await _networkAdapter.get(
      url: ApiRoutes.items,
      queryParameters: {'category': category, 'alpha': alpha, 'page': 1},
    );

    return response;
  }

  @override
  Future<Response> getItemDetails({required int itemId}) async {
    final Response response = await _networkAdapter.get(
      url: ApiRoutes.detail,
      queryParameters: {'item': itemId.toString()},
    );

    return response;
  }
}
