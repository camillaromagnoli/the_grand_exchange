import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  const ItemEntity({
    required this.id,
    required this.name,
    required this.icon,
    required this.iconLarge,
    required this.type,
    required this.typeIcon,
    required this.price,
    required this.members,
  });

  final int id;
  final String name;
  final String icon;
  final String? iconLarge;
  final String type;
  final String? typeIcon;
  final String? price;
  final bool members;

  @override
  List<Object?> get props => [
    id,
    name,
    icon,
    iconLarge,
    type,
    typeIcon,
    price,
    members,
  ];
}
