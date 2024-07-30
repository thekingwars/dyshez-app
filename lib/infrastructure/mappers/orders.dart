import 'package:dyshez_app/domain/entities/orders.dart';
import 'package:dyshez_app/infrastructure/models/orders.dart';

class OrdersMapper {
  static Order orderModelToEntity(OrderModel orderModel) {
    return Order(
      id: orderModel.id,
      name: orderModel.productName,
      image: orderModel.productImage,
      price: orderModel.productPrice.toDouble(),
      quantity: orderModel.productQuantity.toInt(),
      status: orderModel.productStatus ? 'Completado' : 'No Presentado',
      userId: orderModel.userId,
      createdAt: DateTime.parse(orderModel.createdAt),
      type: orderModel.productType,
    );
  }
}
