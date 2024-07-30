import 'package:dyshez_app/domain/entities/orders.dart';

abstract class OrdersRepository {
  Future<List<Order>> getOrders({int start, int limit});
  Future<Order> getOrder({required String id});
}
