part of 'items_bloc.dart';

abstract class ItemsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetItemsEvent extends ItemsEvent {}
