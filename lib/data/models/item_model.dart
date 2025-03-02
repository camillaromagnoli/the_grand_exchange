import 'package:the_grand_exchange/core/extensions/string_extensions.dart';
import 'package:the_grand_exchange/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  const ItemModel({
    required super.id,
    required super.name,
    required super.icon,
    required super.iconLarge,
    required super.type,
    required super.typeIcon,
    required super.price,
    required super.members,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: json['icon'] as String,
      iconLarge: json['icon_large'] as String?,
      type: json['type'] as String,
      typeIcon: json['type_icon'] as String?,
      price: json['price'] as String?,
      members: json['members'].toString().toLowerCase().toBool(),
    );
  }
}
