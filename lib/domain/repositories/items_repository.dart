import 'package:the_grand_exchange/data/models/item_details_model.dart';
import 'package:the_grand_exchange/data/models/item_model.dart';

abstract class ItemsRepository {
  Future<List<ItemModel>> getItems({
    required int category,
    required String alpha,
    required int page,
  });
  Future<ItemDetailsModel> getItemDetails({required int itemId});
  Future<List<ItemModel>> searchItem({required String name});
}
