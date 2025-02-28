import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_grand_exchange/config/dependencies.dart';
import 'package:the_grand_exchange/design/card_item.dart';
import 'package:the_grand_exchange/domain/entities/item_entity.dart';
import 'package:the_grand_exchange/presentation/bloc/items_bloc.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ItemsBloc>(
      create: (context) => getIt<ItemsBloc>()..add(GetItemsEvent()),
      child: Scaffold(
        appBar: AppBar(title: Text('The Grand Exchange')),
        body: BlocBuilder<ItemsBloc, ItemsState>(
          builder: (context, state) {
            if (state is ItemsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ItemsSuccessState) {
              final List<ItemEntity> items = state.items;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final ItemEntity item = items[index];
                  return CardItem(label: item.name ?? '', urlImage: item.icon!);
                },
                itemCount: items.length,
              );
            } else {
              return Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }
}
