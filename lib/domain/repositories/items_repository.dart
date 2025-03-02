import 'package:the_grand_exchange/data/models/item_details_model.dart';
import 'package:the_grand_exchange/data/models/item_model.dart';

abstract class ItemsRepository {
  Future<List<ItemModel>> getItems();
  Future<ItemDetailsModel> getItemDetails({required int itemId});
}
