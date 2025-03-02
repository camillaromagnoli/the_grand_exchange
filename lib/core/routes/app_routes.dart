import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:the_grand_exchange/config/dependencies.dart';
import 'package:the_grand_exchange/core/routes/app_routes_path.dart';
import 'package:the_grand_exchange/presentation/bloc/items_bloc.dart';
import 'package:the_grand_exchange/presentation/pages/item_details_page.dart';
import 'package:the_grand_exchange/presentation/pages/items_page.dart';

final appRoutes = <GoRoute>[
  GoRoute(
    path: AppRoutePaths.items,
    builder: (context, state) {
      return BlocProvider<ItemsBloc>(
        create: (context) => getIt<ItemsBloc>(),
        child: const ItemsPage(),
      );
    },
  ),
  GoRoute(
    path: AppRoutePaths.itemDetails,
    builder: (context, state) {
      final int itemId = state.extra as int;
      return BlocProvider<ItemsBloc>(
        create: (context) => getIt<ItemsBloc>(),
        child: ItemDetailsPage(itemId: itemId),
      );
    },
  ),
];
