import 'package:dio/dio.dart';

abstract class ItemsService {
  Future<Response> getItems({
    required int category,
    required String alpha,
    required int page,
  });
  Future<Response> getItemDetails({required int itemId});
}
