import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:the_grand_exchange/core/exceptions/failure.dart';
import 'package:the_grand_exchange/data/models/item_details_model.dart';
import 'package:the_grand_exchange/data/models/item_model.dart';
import 'package:the_grand_exchange/domain/repositories/items_repository.dart';
import 'package:the_grand_exchange/domain/services/items_service.dart';

@Injectable(as: ItemsRepository)
class ItemsRepositoryImpl extends ItemsRepository {
  ItemsRepositoryImpl({required this.itemsService});

  ItemsService itemsService;

  @override
  Future<List<ItemModel>> getItems() async {
    try {
      final Response response = await itemsService.getItems();

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

  @override
  Future<ItemDetailsModel> getItemDetails({required int itemId}) async {
    try {
      final Response response = await itemsService.getItemDetails(
        itemId: itemId,
      );

      final decodedResponse = json.decode(response.data);
      final items = decodedResponse['item'];
      final ItemDetailsModel itemDetailsModel = ItemDetailsModel.fromJson(
        items,
      );

      return itemDetailsModel;
    } on DioException catch (e) {
      throw handleDioError(e);
    } catch (e) {
      throw ServerException();
    }
  }
}
