import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:the_grand_exchange/domain/entities/item_details_entity.dart';
import 'package:the_grand_exchange/domain/repositories/items_repository.dart';

part 'item_details_event.dart';
part 'item_details_state.dart';

@injectable
class ItemDetailsBloc extends Bloc<ItemDetailsEvent, ItemDetailsState> {
  final ItemsRepository _itemsRepository;

  ItemDetailsBloc({required ItemsRepository itemsRepository})
    : _itemsRepository = itemsRepository,
      super(ItemDetailsStateInitial()) {
    on<GetItemDetailsEvent>(_onGetItemDetails);
  }

  Future<void> _onGetItemDetails(
    GetItemDetailsEvent event,
    Emitter<ItemDetailsState> emit,
  ) async {
    emit(ItemDetailsLoadingState());
    try {
      final response = await _itemsRepository.getItemDetails(
        itemId: event.itemId,
      );
      emit(ItemDetailsSuccessState(itemDetailsEntity: response));
    } catch (e) {
      emit(ItemDetailsErrorState(failure: ''));
    }
  }
}
