import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:the_grand_exchange/config/dependencies.config.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  Dio get dio => Dio();
}

class $RegisterModule extends RegisterModule {}

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
void configureDependencies() => getIt.init();
