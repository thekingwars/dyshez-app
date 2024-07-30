import 'package:dyshez_app/domain/entities/orders.dart';

abstract class OrdersDatasources {
  Future<List<Order>> getOrders({required int start, required int limit});
  Future<Order> getOrder({required String id});
}
