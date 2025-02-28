part of 'items_bloc.dart';

sealed class ItemsState extends Equatable {
  const ItemsState();

  @override
  List<Object?> get props => [];
}

final class ItemsStateInitial extends ItemsState {}

final class ItemsSuccessState extends ItemsState {
  const ItemsSuccessState({required this.items});

  final List<ItemEntity> items;
}

final class ItemsLoadingState extends ItemsState {}

final class ItemsErrorState extends ItemsState {
  const ItemsErrorState({required this.failure});

  final String failure;
}
