import 'package:dyshez_app/domain/repositories/orders.dart';
import 'package:dyshez_app/infrastructure/datasources/orders.dart';
import 'package:dyshez_app/infrastructure/repositories/orders.dart';
import 'package:dyshez_app/presentation/controllers/orders.dart';
import 'package:get/get.dart';

class OrdersBinding extends Bindings {
  final OrdersRepository ordersRepository = OrdersRepositoryImpl(
    ordersDatasources: OrdersDatasourceImpl(),
  );

  @override
  void dependencies() {
    Get.lazyPut<OrdersController>(
      () => OrdersController(
        repository: ordersRepository,
      ),
    );
  }
}
