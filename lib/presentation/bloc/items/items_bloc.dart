import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:the_grand_exchange/domain/entities/item_entity.dart';
import 'package:the_grand_exchange/domain/repositories/items_repository.dart';

part 'items_event.dart';
part 'items_state.dart';

@injectable
class ItemsBloc extends Bloc<ItemsEvent, ItemsState> {
  final ItemsRepository _itemsRepository;

  ItemsBloc({required ItemsRepository itemsRepository})
    : _itemsRepository = itemsRepository,
      super(ItemsStateInitial()) {
    on<GetItemsEvent>(_onGetItems);
  }

  Future<void> _onGetItems(
    GetItemsEvent event,
    Emitter<ItemsState> emit,
  ) async {
    emit(ItemsLoadingState());
    try {
      final response = await _itemsRepository.getItems(
        category: event.category,
        alpha: event.alpha,
        page: event.page,
      );
      emit(ItemsSuccessState(items: response));
    } catch (e) {
      emit(ItemsErrorState(failure: ''));
    }
  }
}
