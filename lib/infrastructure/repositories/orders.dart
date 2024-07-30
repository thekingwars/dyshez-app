import 'package:dyshez_app/domain/datasources/orders.dart';
import 'package:dyshez_app/domain/entities/orders.dart';
import 'package:dyshez_app/domain/repositories/orders.dart';

class OrdersRepositoryImpl extends OrdersRepository {
  final OrdersDatasources ordersDatasources;

  OrdersRepositoryImpl({required this.ordersDatasources});

  @override
  Future<List<Order>> getOrders({
    int limit = 0,
    int start = 10,
  }) async {
    try {
      return await ordersDatasources.getOrders(limit: limit, start: start);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Order> getOrder({required String id}) async {
    try {
      return await ordersDatasources.getOrder(id: id);
    } catch (e) {
      rethrow;
    }
  }
}
