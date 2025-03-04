import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:the_grand_exchange/config/dependencies.dart';
import 'package:the_grand_exchange/core/routes/app_routes_path.dart';
import 'package:the_grand_exchange/data/enums/item_category_enum.dart';
import 'package:the_grand_exchange/design/chips_choice.dart';
import 'package:the_grand_exchange/design/list_item.dart';
import 'package:the_grand_exchange/domain/entities/item_entity.dart';
import 'package:the_grand_exchange/presentation/bloc/items/items_bloc.dart';

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ItemsBloc>(
      create:
          (context) =>
              getIt<ItemsBloc>()
                ..add(GetItemsEvent(category: 1, alpha: 'a', page: 1)),
      child: Scaffold(
        backgroundColor: Color.fromRGBO(205, 152, 132, 1),
        appBar: AppBar(title: Text('The Grand Exchange')),
        body: BlocBuilder<ItemsBloc, ItemsState>(
          builder: (context, state) {
            if (state is ItemsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ItemsSuccessState) {
              final List<ItemEntity> items = state.items;
              return ListView.separated(
                padding: EdgeInsets.all(16.0),
                separatorBuilder: (context, index) {
                  return Divider();
                },
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Row(
                      children: [
                        ChipsChoice(
                          leading: Text(ItemCategory.miscellaneous.name),
                          selected: isSelected,
                          onTap: (selected) {
                            setState(() {
                              isSelected = selected;
                            });
                          },
                        ),
                      ],
                    );
                  }
                  final ItemEntity item = items[index - 1];
                  return ListItem(
                    label: item.name,
                    urlImage: item.icon,
                    onTap: () {
                      context.push(AppRoutePaths.itemDetails, extra: item);
                    },
                  );
                },
                itemCount: items.length + 1,
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
