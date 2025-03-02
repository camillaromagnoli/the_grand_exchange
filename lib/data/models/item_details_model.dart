import 'package:the_grand_exchange/core/extensions/string_extensions.dart';
import 'package:the_grand_exchange/domain/entities/item_details_entity.dart';

class ItemDetailsModel extends ItemDetailsEntity {
  const ItemDetailsModel({
    required super.id,
    required super.name,
    required super.icon,
    required super.iconLarge,
    required super.type,
    required super.typeIcon,
    required super.description,
    required super.members,
    required super.trend,
    required super.price,
    required super.change,
  });

  factory ItemDetailsModel.fromJson(Map<String, dynamic> json) {
    return ItemDetailsModel(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: json['icon'] as String,
      iconLarge: json['icon_large'] as String,
      type: json['type'] as String,
      typeIcon: json['type_icon'] as String,
      description: json['description'] as String,
      members: json['members'].toString().toLowerCase().toBool(),
      trend: json['trend'] as String,
      price: json['price'] as String,
      change: json['change'] as String,
    );
  }
}
