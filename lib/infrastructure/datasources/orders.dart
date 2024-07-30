import 'package:dyshez_app/domain/datasources/orders.dart';
import 'package:dyshez_app/domain/entities/orders.dart';
import 'package:dyshez_app/infrastructure/mappers/orders.dart';
import 'package:dyshez_app/infrastructure/models/orders.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class OrdersDatasourceImpl extends OrdersDatasources {
  final SupabaseClient supabase = Supabase.instance.client;

  @override
  Future<List<Order>> getOrders({int start = 0, int limit = 10}) async {
    final response = await supabase
        .from('Orders')
        .select()
        .order('product_status', ascending: true)
        .range(start, start + limit - 1);

    final List<OrderModel> ordersModel = response.map((e) {
      return OrderModel.fromJson(e);
    }).toList();

    final orders =
        ordersModel.map((e) => OrdersMapper.orderModelToEntity(e)).toList();

    return orders;
  }

  @override
  Future<Order> getOrder({required String id}) async {
    final response = await supabase.from('Orders').select().eq('id', id);

    final OrderModel orderModel = OrderModel.fromJson(response[0]);

    return OrdersMapper.orderModelToEntity(orderModel);
  }
}
