import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:the_grand_exchange/core/exceptions/failure.dart';
import 'package:the_grand_exchange/data/models/item_model.dart';
import 'package:the_grand_exchange/domain/repositories/items_repository.dart';
import 'package:the_grand_exchange/domain/services/items_service.dart';

@Injectable(as: ItemsRepository)
class ItemsRepositoryImpl extends ItemsRepository {
  ItemsRepositoryImpl({required this.ingredientsService});

  ItemsService ingredientsService;

  @override
  Future<List<ItemModel>> getItems() async {
    try {
      final Response response = await ingredientsService.getItems();

      final decodedResponse = json.decode(response.data);
      final List items = decodedResponse['items'];
      final List<ItemModel> itemsModelList =
          (items).map((data) => ItemModel.fromJson(data)).toList();

      return itemsModelList;
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw ServerException();
    }
  }
}
