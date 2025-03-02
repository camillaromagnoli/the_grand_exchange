import 'package:equatable/equatable.dart';

class ItemDetailsEntity extends Equatable {
  const ItemDetailsEntity({
    required this.id,
    required this.name,
    required this.icon,
    required this.iconLarge,
    required this.type,
    required this.typeIcon,
    required this.description,
    required this.members,
    required this.trend,
    required this.price,
    required this.change,
  });

  final int id;
  final String name;
  final String icon;
  final String iconLarge;
  final String type;
  final String typeIcon;
  final String description;
  final bool members;
  final String trend;
  final String price;
  final String change;

  @override
  List<Object?> get props => [
    id,
    name,
    icon,
    iconLarge,
    type,
    typeIcon,
    description,
    members,
    trend,
    price,
    change,
  ];
}
