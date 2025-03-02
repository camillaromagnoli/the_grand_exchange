import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_grand_exchange/domain/entities/item_entity.dart';
import 'package:the_grand_exchange/presentation/bloc/item_details/item_details_bloc.dart';

class ItemDetailsPage extends StatefulWidget {
  const ItemDetailsPage({required this.itemEntity, super.key});

  final ItemEntity itemEntity;

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.itemEntity.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ItemDetailsBloc, ItemDetailsState>(
          builder: (context, state) {
            if (state is ItemDetailsLoadingState) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ItemDetailsSuccessState) {
              return Column(children: [Text('Success!')]);
            } else {
              return Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }
}
