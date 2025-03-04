import 'package:go_router/go_router.dart';
import 'package:the_grand_exchange/core/routes/app_routes_path.dart';
import 'package:the_grand_exchange/domain/entities/item_entity.dart';
import 'package:the_grand_exchange/presentation/pages/item_details_page.dart';
import 'package:the_grand_exchange/presentation/pages/items_page.dart';

final appRoutes = <GoRoute>[
  GoRoute(path: AppRoutePaths.items, builder: (context, state) => ItemsPage()),
  GoRoute(
    path: AppRoutePaths.itemDetails,
    builder: (context, state) {
      final ItemEntity item = state.extra as ItemEntity;
      return ItemDetailsPage(itemEntity: item);
    },
  ),
];
