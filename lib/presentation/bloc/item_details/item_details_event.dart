part of 'item_details_bloc.dart';

abstract class ItemDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetItemDetailsEvent extends ItemDetailsEvent {
  final int itemId;

  GetItemDetailsEvent({required this.itemId});

  @override
  List<Object?> get props => [itemId];
}
