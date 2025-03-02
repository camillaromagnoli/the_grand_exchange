import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:the_grand_exchange/core/adapters/network_adapter.dart';
import 'package:the_grand_exchange/domain/services/items_service.dart';

@Injectable(as: ItemsService)
class ItemsServiceImpl extends ItemsService {
  ItemsServiceImpl({required NetworkAdapter networkAdapter})
    : _networkAdapter = networkAdapter;

  final NetworkAdapter _networkAdapter;

  @override
  Future<Response> getItems() async {
    const url =
        'https://secure.runescape.com/m=itemdb_rs/api/catalogue/items.json';

    final Response response = await _networkAdapter.get(
      url: url,
      queryParameters: {'category': 0, 'alpha': 'd', 'page': 1},
    );

    return response;
  }

  @override
  Future<Response> getItemDetails({required int itemId}) async {
    const url =
        'https://secure.runescape.com/m=itemdb_rs/api/catalogue/detail.json';

    final Response response = await _networkAdapter.get(
      url: url,
      queryParameters: {'item': itemId.toString()},
    );

    return response;
  }
}
