// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:the_grand_exchange/presentation/bloc/items_bloc.dart';

import '../core/adapters/network_adapter.dart' as _i1048;
import '../data/repositories/items_repository_impl.dart' as _i780;
import '../data/services/items_service_impl.dart' as _i743;
import '../domain/repositories/items_repository.dart' as _i1051;
import '../domain/services/items_service.dart' as _i1057;
import 'dependencies.dart' as _i372;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i1048.NetworkAdapter>(
      () => _i1048.NetworkAdapterImpl(gh<_i361.Dio>()),
    );
    gh.factory<_i1057.ItemsService>(
      () => _i743.ItemsServiceImpl(networkAdapter: gh<_i1048.NetworkAdapter>()),
    );
    gh.factory<_i1051.ItemsRepository>(
      () => _i780.ItemsRepositoryImpl(
        ingredientsService: gh<_i1057.ItemsService>(),
      ),
    );
    gh.factory<ItemsBloc>(
      () => ItemsBloc(itemsRepository: gh<_i1051.ItemsRepository>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i372.RegisterModule {}
