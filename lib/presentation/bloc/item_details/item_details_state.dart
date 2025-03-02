part of 'item_details_bloc.dart';

sealed class ItemDetailsState extends Equatable {
  const ItemDetailsState();

  @override
  List<Object?> get props => [];
}

final class ItemDetailsStateInitial extends ItemDetailsState {}

final class ItemDetailsSuccessState extends ItemDetailsState {
  const ItemDetailsSuccessState({required this.itemDetailsEntity});

  final ItemDetailsEntity itemDetailsEntity;
}

final class ItemDetailsLoadingState extends ItemDetailsState {}

final class ItemDetailsErrorState extends ItemDetailsState {
  const ItemDetailsErrorState({required this.failure});

  final String failure;
}
