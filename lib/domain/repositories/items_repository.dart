import 'package:the_grand_exchange/data/models/item_model.dart';

abstract class ItemsRepository {
  Future<List<ItemModel>> getItems();
}
