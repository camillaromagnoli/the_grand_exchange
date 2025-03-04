part of 'items_bloc.dart';

abstract class ItemsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetItemsEvent extends ItemsEvent {
  final int category;
  final String alpha;
  final int page;

  GetItemsEvent({
    required this.category,
    required this.alpha,
    required this.page,
  });

  @override
  List<Object?> get props => [category, alpha, page];
}
