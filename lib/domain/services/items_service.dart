import 'package:dio/dio.dart';

abstract class ItemsService {
  Future<Response> getItems();
  Future<Response> getItemDetails({required int itemId});
}
